import 'package:lovedan/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user detals
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up as Anonymous User
  Future signInAnonymously() async {
    String res = "エラーが発生しました。。。もう一度試してください。";
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      model.User _user = model.User(
        uid: userCredential.user!.uid,
        watchingList: [],
      );

      // adding user in our database
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(_user.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
      print(res);
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
