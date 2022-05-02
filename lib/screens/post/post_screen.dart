import 'package:flutter/material.dart';
import 'package:lovedan/config/size_config.dart';
import 'package:lovedan/resources/firestore_methods.dart';
import 'package:lovedan/utils/colors.dart';
import 'package:lovedan/utils/utils.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _form = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void postTheme(String uid) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FireStoreMethods()
          .postTheme(_titleController.text, _descriptionController.text, uid);
      if (res == "success") {
        // end the loading
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Posted!',
        );
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '投稿',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
