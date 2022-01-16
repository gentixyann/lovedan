import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/question_model.dart';
import '../../config/size_config.dart';
import '../../services/question_service.dart';
import '../../services/comment_service.dart';
import '../../widgets/comment/view_comments.dart';
import '../../screens/post_comment/post_comment_screen.dart';

class QuestionDetailScreen extends StatelessWidget {
  static const routeName = '/question-detail';
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  DateTime _date;
  QuestionModel _question;

  void _goToPostComment(BuildContext ctx, QuestionModel question) {
    Navigator.of(ctx)
        .pushNamed(PostCommentScreen.routeName, arguments: question);
  }

  void _openComment() {
    print('tap');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final _questionId = routeArgs['id'];
    final questionService =
        Provider.of<QuestionService>(context, listen: false);
    final commentService = Provider.of<CommentService>(context, listen: false);
    questionService.questionId = _questionId;
    commentService.questionId = _questionId;

    return Scaffold(
      appBar: AppBar(
        title: Text('悩みをみる'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<DocumentSnapshot>(
              stream: questionService.questionPaht.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                    questionService.getQuestion(snapshot.data);
                    _date = questionService.question.createdAt.toDate();
                    _question = questionService.question;
                    return Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 5,
                        left: SizeConfig.blockSizeHorizontal * 7,
                        right: SizeConfig.blockSizeHorizontal * 7,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(),
                            child: Text(
                              _question.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 3,
                            ),
                            child: Text(
                              _question.description,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                _question.posterName,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(' / '),
                              Text(outputFormat.format(_date).toString(),
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ],
                      ),
                    );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.comment,
                    size: 40,
                  ),
                  onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => ViewComments(),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 10),
              child: Center(
                  child: ElevatedButton.icon(
                onPressed: () {
                  _goToPostComment(context, _question);
                },
                icon: const Icon(Icons.add_comment),
                label: const Text('悩みに回答する'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  onPrimary: Colors.black,
                  shape: const StadiumBorder(),
                ),
              )),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     _goToPostComment(context, _question);
      //   },
      //   label: const Text('悩みに回答する'),
      //   icon: const Icon(Icons.add_comment),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
