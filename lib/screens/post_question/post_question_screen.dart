import 'package:flutter/material.dart';

class PostQuestionScreen extends StatelessWidget {
  static const routeName = '/postQuestion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('悩み投稿'),
      ),
      body: Center(
        child: Text('PostQuestionScreen'),
      ),
    );
  }
}
