import 'package:flutter/material.dart';
import '../../config/size_config.dart';

class PostQuestionScreen extends StatelessWidget {
  static const routeName = '/postQuestion';
  final _form = GlobalKey<FormState>();

  final titleEditingController = TextEditingController();
  final descEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('悩みを投稿'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 5,
              horizontal: SizeConfig.blockSizeHorizontal * 5,
            ),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  Text(
                    'タイトル',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextFormField(
                    controller: titleEditingController,
                    style: Theme.of(context).textTheme.headline6,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '投稿のタイトルを入力してね',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.blockSizeVertical,
                  ),
                  Text('内容'),
                  TextFormField(
                    controller: descEditingController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'どんな悩みか、詳細を入力してね',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )));
  }
}
