import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/question_model.dart';
import '../../config/size_config.dart';
import '../../services/question_service.dart';

class QuestionDetail extends StatelessWidget {
  static const routeName = '/question-detail';
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  DateTime _date;
  QuestionModel _question;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final _questionId = routeArgs['id'];
    final questionService =
        Provider.of<QuestionService>(context, listen: false);
    questionService.questionId = _questionId;

    return Scaffold(
        appBar: AppBar(
          title: Text('悩みをみる'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 7,
            right: SizeConfig.blockSizeHorizontal * 7,
          ),
          child: StreamBuilder<DocumentSnapshot>(
            stream: questionService.questionPaht.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  // streamからデータを取得できたので、使いやすい形にかえてあげる
                  questionService.getQuestion(snapshot.data);
                  _date = questionService.question.createdAt.toDate();
                  _question = questionService.question;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(),
                        child: Text(
                          _question.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3,
                        ),
                        child: Text(
                          questionService.question.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            _question.posterName,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(' / '),
                          Text(outputFormat.format(_date).toString(),
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ],
                  );
              }
            },
          ),
        ));
  }
}
