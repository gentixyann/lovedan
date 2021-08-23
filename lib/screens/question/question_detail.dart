import 'package:flutter/material.dart';

class QuestionDetail extends StatelessWidget {
  static const routeName = '/question-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final _questionId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('悩みをみる'),
      ),
      body: Center(
        child: Text(_questionId.toString()),
      ),
    );
  }
}
