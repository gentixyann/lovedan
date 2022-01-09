import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/question_model.dart';
import '../../config/size_config.dart';
import '../../services/comment_service.dart';

class PostCommentScreen extends StatelessWidget {
  static const routeName = '/post-comment';
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  DateTime _date;
  QuestionModel _question;

  final _form = GlobalKey<FormState>();

  final commentEditingController = TextEditingController();
  final nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _question = ModalRoute.of(context).settings.arguments;
    _date = _question.createdAt.toDate();

    final commentService = Provider.of<CommentService>(context, listen: false);
    commentService.questionId = _question.docId;

    return Scaffold(
        appBar: AppBar(
          title: Text('悩みに回答'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '悩みに回答する',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 5,
                    horizontal: SizeConfig.blockSizeHorizontal * 7),
                child: Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '回答内容',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextFormField(
                          controller: commentEditingController,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: '親切なアドバイス、回答を心がけよう😌',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 5 * SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          '名前',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextFormField(
                          controller: nameEditingController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          maxLength: 15,
                          decoration: InputDecoration(
                            hintText: '無記名の場合「匿名」になるよ',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 5 * SizeConfig.blockSizeVertical,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            commentService.postComment(
                                commentEditingController.text,
                                nameEditingController.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              '回答内容を確認する',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            onPrimary: Colors.black,
                            shape: const StadiumBorder(),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
