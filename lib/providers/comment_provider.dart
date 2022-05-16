import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lovedan/models/comment.dart';

class CommentProvider with ChangeNotifier {
  List<Comment>? comments;

  void fetchComments(String postId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy(
          'datePublished',
          descending: true,
        )
        .get();

    // Firestoreから取得した値をListに格納
    final List<Comment> _comments =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String commentId = data['commentId'];
      final DateTime datePublished = data['datePublished'].toDate();
      final String text = data['text'];
      final String uid = data['uid'];
      return Comment(commentId, datePublished, text, uid);
    }).toList();

    this.comments = _comments;

    notifyListeners();
  }
}
