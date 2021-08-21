import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String _docId;
  String _title;
  String _description;
  Timestamp _createdAt;

  QuestionModel(
    this._docId,
    this._title,
    this._description,
    this._createdAt,
  );

  String get docId => _docId;
  String get title => _title;
  String get description => _description;
  Timestamp get createAt => _createdAt;
}
