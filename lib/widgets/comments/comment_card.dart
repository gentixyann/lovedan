import 'package:flutter/material.dart';
import 'package:lovedan/models/comment.dart';
import 'package:lovedan/providers/comment_provider.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatelessWidget {
  final String postId;
  const CommentCard({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommentProvider>.value(
      value: CommentProvider()..fetchComments(postId),
      child: Consumer<CommentProvider>(
        builder: (context, model, child) {
          final List<Comment>? _comments = model.comments;

          if (_comments == null) {
            return CircularProgressIndicator();
          }

          final List<Widget> _widgets = _comments
              .map((_comment) => Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 50),
                        child: Text(
                          _comment.text,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                      ),
                    ],
                  ))
              .toList();

          return ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: _widgets,
          );
        },
      ),
    );
  }
}
