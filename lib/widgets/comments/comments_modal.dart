import 'package:flutter/material.dart';
import 'package:lovedan/config/size_config.dart';
import 'package:lovedan/models/user.dart';
import 'package:lovedan/providers/user_provider.dart';
import 'package:lovedan/resources/firestore_methods.dart';
import 'package:lovedan/utils/colors.dart';
import 'package:lovedan/utils/utils.dart';
import 'package:lovedan/widgets/comments/comment_card.dart';
import 'package:lovedan/widgets/common_UI/modal_top.dart';
import 'package:provider/provider.dart';

class CommentsModal extends StatefulWidget {
  final String postId;
  const CommentsModal({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsModal> createState() => _CommentsModalState();
}

class _CommentsModalState extends State<CommentsModal> {
  final TextEditingController _commentController = TextEditingController();
  var _enteredComment = '';

  void postComment(BuildContext ctx, String uid) async {
    try {
      String res = await FireStoreMethods()
          .postComment(widget.postId, _commentController.text, uid);
      if (res != 'success') {
        showSnackBar(ctx, res);
      }
      setState(() {
        _commentController.text = "";
      });
      Navigator.of(ctx).pop();
      showSnackBar(
        ctx,
        'コメントを追加しました！',
      );
    } catch (err) {
      showSnackBar(
        ctx,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: SizeConfig.blockSizeVertical! * 80,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ModalTop(),
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
                    // postした時にcomment_providerのfetchCommentsを呼ぶ
                    IconButton(
                        onPressed: _enteredComment.trim().isEmpty
                            ? null
                            : () {
                                postComment(context, user.uid);
                              },
                        icon: Icon(Icons.send))
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
              ),
              CommentCard(
                postId: widget.postId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
