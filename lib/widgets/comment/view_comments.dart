import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/comment_service.dart';

class ViewComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final commentService = Provider.of<CommentService>(context, listen: false);
    return StreamBuilder<QuerySnapshot>(
        stream: commentService.commentsPath
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              // streamからデータを取得できたので、使いやすい形にかえてあげる
              commentService.getComments(snapshot.data.docs);
              return Expanded(
                child: ListView.builder(
                    itemCount: commentService.comments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: <Widget>[
                            Text('削除要請とか'),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 5,
                            ),
                            Text(commentService.comments[index].commentText),
                          ],
                        ),
                      );
                    }),
              );

            // SizedBox(
            //   width: double.infinity,
            //   height: 100,
            //   child: Card(
            //     elevation: 5,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20)),
            //     child: Column(
            //       children: <Widget>[
            //         Text('削除要請とか'),
            //         Divider(
            //           thickness: 1,
            //           color: Colors.grey,
            //           height: 5,
            //         ),
            //         Text('回答の内容'),
            //       ],
            //     ),
            //   ),
            // );
          }
        });
  }
}
