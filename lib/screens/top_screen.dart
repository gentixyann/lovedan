import 'package:flutter/material.dart';
import '../widgets/question/question_card.dart';
import '../config/size_config.dart';

class TopScreen extends StatelessWidget {
  static const routeName = '/top';

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
          print('pressed');
        },
        label: const Text('質問を投稿する'),
        icon: const Icon(Icons.question_answer),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
