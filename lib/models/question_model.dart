import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  late String _docId;
  late String _title;
  late String _description;
  late String _posterName;
  late Timestamp _createdAt;

  QuestionModel(
    this._docId,
    this._title,
    this._description,
    this._posterName,
    this._createdAt,
  );

  String get docId => _docId;
  String get title => _title;
  String get description => _description;
  String get posterName => _posterName;
  Timestamp get createdAt => _createdAt;

  QuestionModel.fromMap(map) {
    String _docId = map.id;
    String _title = map['title'];
    String _description = map['description'];
    String _posterName = map['posterName'];
    Timestamp _createdAt = map['createdAt'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['posterName'] = _posterName;
    map['createdAt'] = _createdAt;
    return map;
  }
}
