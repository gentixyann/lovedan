import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  void _selectQuestion() {
    print('_selectQuestion');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectQuestion(),
      // borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Card(
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: <Widget>[
              Container(
                child: Text('Title'),
              ),
              Container(
                child: Text('text'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
