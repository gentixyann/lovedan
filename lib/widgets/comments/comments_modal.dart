import 'package:flutter/material.dart';
import 'package:lovedan/config/size_config.dart';
import 'package:lovedan/utils/colors.dart';

class CommentsModal extends StatefulWidget {
  final postId;
  const CommentsModal({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsModal> createState() => _CommentsModalState();
}

class _CommentsModalState extends State<CommentsModal> {
  final TextEditingController _commentController = TextEditingController();
  final _focusNode = FocusNode();
  var _enteredComment = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // onTap: () => print('tappu'),
      behavior: HitTestBehavior.opaque,
      child: Container(
          height: SizeConfig.blockSizeVertical! * 80,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'コメント',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                        )),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
              ),
              // コメント入力欄

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(labelText: 'コメントを追加'),
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(
                              color: regularTextColor,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _enteredComment = value;
                              });
                            },
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: _enteredComment.trim().isEmpty
                              ? null
                              : () {
                                  print('submit');
                                },
                          icon: Icon(Icons.send))
                    ],
                  ))
            ],
          )),
    );
  }
}
