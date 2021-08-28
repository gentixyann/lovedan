import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';
import '../models/comment_model.dart';

class CommentService extends ChangeNotifier {
  String uid;
  String questionId;
  QuestionModel _question;
  CommentModel _comment;
  List<CommentModel> _comments;

  CommentService();

  CollectionReference get commentsPath =>
      FirebaseFirestore.instance.collection('questions/$questionId/comments');
  DocumentReference get addComentPath =>
      FirebaseFirestore.instance.doc('questions/$questionId/comments');
}
