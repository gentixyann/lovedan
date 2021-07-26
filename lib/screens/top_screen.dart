import 'package:flutter/material.dart';
import '../widgets/question/question_card.dart';

class TopScreen extends StatelessWidget {
  static const routeName = '/top';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: QuestionCard(),
      ),
    );
  }
}
