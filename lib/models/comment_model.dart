import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String _docId;
  String _questionId;
  String _commentedUserId;
  String _commentedUserName;
  String _commentText;
  Timestamp _createdAt;

  CommentModel(
    this._docId,
    this._questionId,
    this._commentedUserId,
    this._commentedUserName,
    this._commentText,
    this._createdAt,
  );

  String get docId => _docId;
  String get questionId => _questionId;
  String get commentedUserId => _commentedUserId;
  String get commentedUserName => _commentedUserName;
  String get commentText => _commentText;
  Timestamp get createdAt => _createdAt;

  CommentModel.fromMap(map) {
    _docId = map.id;
    _questionId = map['questionId'];
    _commentedUserId = map['commentedUserId'];
    _commentedUserName = map['commentedUserName'];
    _commentText = map['commentText'];
    _createdAt = map['createdAt'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['questionId'] = _questionId;
    map['commentedUserId'] = _commentedUserId;
    map['commentedUserName'] = _commentedUserName;
    map['commentText'] = _commentText;
    map['createdAt'] = _createdAt;
    return map;
  }
}
