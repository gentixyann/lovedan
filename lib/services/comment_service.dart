import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';
import '../models/comment_model.dart';

class CommentService extends ChangeNotifier {
  late String uid;
  late String questionId;
  late QuestionModel _question;
  late CommentModel _comment;
  late List<CommentModel> _comments;

  CommentService();

  CollectionReference get commentsPath =>
      FirebaseFirestore.instance.collection('questions/$questionId/comments');
  DocumentReference get addComentPath =>
      FirebaseFirestore.instance.doc('questions/$questionId/comments');
  List<CommentModel> get comments => _comments;

  void getComments(List<DocumentSnapshot> docs) {
    _comments = docs.map((doc) => CommentModel.fromMap(doc)).toList();
  }

  void postComment(String commentText, String commentedUserName) {
    if (commentedUserName.isEmpty) {
      commentedUserName = '匿名';
    }
    commentsPath.add({
      'questionId': questionId,
      'commentedUserId': uid,
      'commentedUserName': commentedUserName,
      'commentText': commentText,
      'createdAt': Timestamp.now(),
    });
  }
}
