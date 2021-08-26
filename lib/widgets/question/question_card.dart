import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../config/size_config.dart';
import '../../services/question_service.dart';
import '../../screens/question/question_detail_screen.dart';

class QuestionCard extends StatelessWidget {
  void _selectQuestion(BuildContext ctx, String questionId) {
    Navigator.of(ctx)
        .pushNamed(QuestionDetail.routeName, arguments: {'id': questionId});
  }

  DateFormat outputFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final questionService =
        Provider.of<QuestionService>(context, listen: false);
    return ListView.builder(
        itemCount: questionService.questions.length,
        itemBuilder: (BuildContext context, int index) {
          final _date = questionService.questions[index].createdAt.toDate();
          return InkWell(
            splashColor: Theme.of(context).primaryColor,
            onTap: () => _selectQuestion(
              context,
              questionService.questions[index].docId,
            ),
            child: SizedBox(
              width: double.infinity,
              height: SizeConfig.blockSizeVertical * 28,
              child: Card(
                elevation: 5,
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
                        questionService.questions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
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
                          Text(outputFormat.format(_date).toString(),
                              style: TextStyle(color: Colors.grey))
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
