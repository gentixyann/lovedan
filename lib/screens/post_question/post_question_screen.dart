import 'package:flutter/material.dart';
import '../../config/size_config.dart';

class PostQuestionScreen extends StatelessWidget {
  static const routeName = '/postQuestion';
  final _form = GlobalKey<FormState>();

  final titleEditingController = TextEditingController();
  final descEditingController = TextEditingController();

  void _postQuestion() {
    print('post');
  }

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
                Text(
                  '内容',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
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
                SizedBox(
                  height: 5 * SizeConfig.blockSizeVertical,
                ),
                ElevatedButton(
                  onPressed: _postQuestion,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      '投稿内容を確認する',
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
            ),
          )),
    );
  }
}
