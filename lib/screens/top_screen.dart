import 'package:flutter/material.dart';
import '../widgets/question/question_card.dart';
import '../config/size_config.dart';
import '../screens/post_question/post_question_screen.dart';

class TopScreen extends StatelessWidget {
  static const routeName = '/top';

  void _selectedQuestion(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PostQuestionScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: SizeConfig.blockSizeVertical * 5),
        child: QuestionCard(),
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
