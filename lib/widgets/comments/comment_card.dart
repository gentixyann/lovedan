import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovedan/models/comment.dart';
import 'package:lovedan/providers/comment_provider.dart';
import 'package:lovedan/utils/colors.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatelessWidget {
  final String postId;
  const CommentCard({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    // return ChangeNotifierProvider<CommentProvider>.value(
    return ChangeNotifierProvider<CommentProvider>(
      create: (_) => CommentProvider()..fetchComments(postId),
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
                        margin: const EdgeInsets.all(15),
                        child: Text(
                          _comment.text,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.access_time,
                            size: 20,
                            color: grayColor,
                          ),
                          Text(
                            outputFormat.format(_comment.datePublished),
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
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
