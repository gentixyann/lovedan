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

  QuestionModel.fromMap(map) {
    _docId = map.id;
    _title = map['title'];
    _description = map['description'];
    _createdAt = map['createdAt'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['createdAt'] = _createdAt;
    return map;
  }
}
