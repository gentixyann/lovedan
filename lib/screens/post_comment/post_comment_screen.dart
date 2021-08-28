import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/question_model.dart';
import '../../config/size_config.dart';

class PostCommentScreen extends StatelessWidget {
  static const routeName = '/post-comment';
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  DateTime _date;
  QuestionModel _question;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _question = ModalRoute.of(context).settings.arguments;
    _date = _question.createdAt.toDate();

    return Scaffold(
        appBar: AppBar(
          title: Text('悩みに回答'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
                left: SizeConfig.blockSizeHorizontal * 7,
                right: SizeConfig.blockSizeHorizontal * 7,
              ),
              child: Column(
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
                      _question.description,
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
              ),
            )
          ],
        ));
  }
}
