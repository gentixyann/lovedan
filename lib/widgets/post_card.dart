import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final snap;
  PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '投稿です',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
