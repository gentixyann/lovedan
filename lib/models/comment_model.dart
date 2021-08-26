import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String _docId;
  String _commentedUserId;
  String _commentedUserName;
  String _commentText;
  Timestamp _createdAt;

  CommentModel(
    this._docId,
    this._commentedUserId,
    this._commentedUserName,
    this._commentText,
    this._createdAt,
  );

  String get docId => _docId;
  String get commentedUserId => _commentedUserId;
  String get commentedUserName => _commentedUserName;
  String get commentText => _commentText;
  Timestamp get createdAt => _createdAt;
}
