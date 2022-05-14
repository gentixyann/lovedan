import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          child: Text(
            snap.data()['text'],
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
