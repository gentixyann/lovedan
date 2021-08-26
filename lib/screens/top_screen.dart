import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/question/question_card.dart';
import '../config/size_config.dart';
import '../screens/post_question/post_question_screen.dart';
import '../services/auth_service.dart';
import '../services/question_service.dart';

class TopScreen extends StatelessWidget {
  static const routeName = '/top';

  void _selectedQuestion(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PostQuestionScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final questionService =
        Provider.of<QuestionService>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 5, left: 10, right: 10),
        child: StreamBuilder<QuerySnapshot>(
            stream: questionService.allQuestionPath
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  questionService.init(snapshot.data.docs);
                  return QuestionCard();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _selectedQuestion(context);
        },
        label: const Text('悩みを投稿する'),
        icon: const Icon(Icons.question_answer),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
