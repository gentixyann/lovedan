import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final List watchingList;

  const User({
    required this.uid,
    required this.watchingList,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      watchingList: snapshot["watchingList"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "watchingList": watchingList,
      };
}
