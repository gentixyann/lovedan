import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String title;
  final String description;
  final String uid;
  final likes;
  final String postId;
  final DateTime datePublished;

  const Post({
    required this.title,
    required this.description,
    required this.uid,
    required this.likes,
    required this.postId,
    required this.datePublished,
  });

  // Firebaseから取得するときsnapからmapにする
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      title: snapshot["title"],
      description: snapshot["description"],
      uid: snapshot["uid"],
      likes: snapshot["likes"],
      postId: snapshot["postId"],
      datePublished: snapshot["datePublished"],
    );
  }

// postするときにjsonにする
  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "uid": uid,
        "likes": likes,
        "postId": postId,
        "datePublished": datePublished,
      };
}
