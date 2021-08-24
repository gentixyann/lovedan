import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../services/question_service.dart';

class QuestionDetail extends StatelessWidget {
  static const routeName = '/question-detail';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final _questionId = routeArgs['id'];
    final questionService = Provider.of<QuestionService>(context);
    questionService.questionId = _questionId;
    return Scaffold(
        appBar: AppBar(
          title: Text('悩みをみる'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 5, left: 10, right: 10),
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(questionService.question.title),
                      )
                    ],
                  );
              }
            },
          ),
        ));
  }
}
