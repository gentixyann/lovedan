import 'package:flutter/material.dart';
import '../../models/question_model.dart';

class PostCommentScreen extends StatelessWidget {
  static const routeName = '/post-comment';
  QuestionModel _question;

  @override
  Widget build(BuildContext context) {
    _question = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('悩みに回答'),
      ),
      body: Center(
        child: Text('PostCommentScreen'),
      ),
    );
  }
}
