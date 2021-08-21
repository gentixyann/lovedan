import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionService extends ChangeNotifier {
  String uid;
  List _questions;

  QuestionService();

  CollectionReference get allQuestionPath =>
      FirebaseFirestore.instance.collection('questions');
  CollectionReference get myQuestionPath =>
      FirebaseFirestore.instance.collection('users/$uid/myQuestions');
  List get questions => _questions;

  void postQuestion(String title, String description) {
    allQuestionPath.add({
      'poster': uid,
      'title': title,
      'description': description,
      'createdAt': Timestamp.now(),
    });
  }
}
