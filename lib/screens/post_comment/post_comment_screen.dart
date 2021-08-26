import 'package:flutter/material.dart';

class PostCommentScreen extends StatelessWidget {
  static const routeName = '/post-comment';

  @override
  Widget build(BuildContext context) {
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
