import 'package:flutter/material.dart';
import 'package:lovedan/config/size_config.dart';

class CommentsModal extends StatefulWidget {
  final postId;
  const CommentsModal({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsModal> createState() => _CommentsModalState();
}

class _CommentsModalState extends State<CommentsModal> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 80,
      child: Text(
        widget.postId,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
