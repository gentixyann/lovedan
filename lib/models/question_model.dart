import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String _docId;
  String _title;
  String _description;
  String _posterName;
  Timestamp _createdAt;

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
    _docId = map.id;
    _title = map['title'];
    _description = map['description'];
    _posterName = map['posterName'];
    _createdAt = map['createdAt'];
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
