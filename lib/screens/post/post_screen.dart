import 'package:flutter/material.dart';
import 'package:lovedan/config/size_config.dart';
import 'package:lovedan/providers/user_provider.dart';
import 'package:lovedan/resources/firestore_methods.dart';
import 'package:lovedan/utils/colors.dart';
import 'package:lovedan/utils/utils.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void postTheme(String uid) async {
    if (this._form.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        String res = await FireStoreMethods()
            .postTheme(_titleController.text, _descriptionController.text, uid);
        if (res == "success") {
          // end the loading
          setState(() {
            _isLoading = false;
            _titleController.text = '';
            _descriptionController.text = '';
          });
          showSnackBar(
            context,
            '投稿完了！',
          );
          Navigator.pop(context);
        }
      } catch (err) {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(
          context,
          err.toString(),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '投稿',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical! * 5,
            horizontal: SizeConfig.blockSizeHorizontal! * 5,
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
                  controller: _titleController,
                  style: Theme.of(context).textTheme.headline6,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '投稿のタイトルを入力してね',
                    hintStyle: TextStyle(color: grayColor),
                  ),
                  validator: (value) {
                    if (value!.length <= 4) {
                      return 'せめて４文字以上は入力して・・・🥺';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10 * SizeConfig.blockSizeVertical!,
                ),
                Text(
                  '内容',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextFormField(
                  controller: _descriptionController,
                  style: Theme.of(context).textTheme.bodyText1,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '相談したいことや聞きたいことを入力してね',
                    hintStyle: TextStyle(color: grayColor),
                  ),
                ),
                SizedBox(
                  height: 10 * SizeConfig.blockSizeVertical!,
                ),
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !_isLoading
                        ? const Text('投稿')
                        : const CircularProgressIndicator(color: primaryColor),
                  ),
                  onPressed: () =>
                      _isLoading ? null : postTheme(userProvider.getUser.uid),
                  style: TextButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: const StadiumBorder(),
                    minimumSize: Size(60 * SizeConfig.blockSizeHorizontal!, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
