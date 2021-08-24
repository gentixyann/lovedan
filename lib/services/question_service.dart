import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class QuestionService extends ChangeNotifier {
  String uid;
  String questionId;
  QuestionModel _question;
  List<QuestionModel> _questions;

  QuestionService();

  CollectionReference get allQuestionPath =>
      FirebaseFirestore.instance.collection('questions');
  DocumentReference get questionPaht =>
      FirebaseFirestore.instance.doc('questions/$questionId');
  CollectionReference get myQuestionPath =>
      FirebaseFirestore.instance.collection('users/$uid/myQuestions');
  QuestionModel get question => _question;
  List<QuestionModel> get questions => _questions;

  void init(List<DocumentSnapshot> docs) {
    _questions = docs.map((doc) => QuestionModel.fromMap(doc)).toList();
  }

  void getQuestion(DocumentSnapshot doc) {
    _question = QuestionModel.fromMap(doc);
  }

  void postQuestion(String title, String description) {
    allQuestionPath.add({
      'poster': uid,
      'title': title,
      'description': description,
      'createdAt': Timestamp.now(),
    });
  }
}
