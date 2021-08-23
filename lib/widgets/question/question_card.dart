import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../services/question_service.dart';

class QuestionCard extends StatelessWidget {
  void _selectQuestion() {
    print('_selectQuestion');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final questionService = Provider.of<QuestionService>(context);
    return ListView.builder(
        itemCount: questionService.questions.length,
        itemBuilder: (BuildContext context, int index) {
          final _date = questionService.questions[index].createdAt.toDate();
          return InkWell(
            onTap: () => _selectQuestion(),
            // borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.infinity,
              height: SizeConfig.blockSizeVertical * 30,
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        // 'どうして異性と付き合ったら行為をしなければいけないんですか？',
                        questionService.questions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Text(_date.toString())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
