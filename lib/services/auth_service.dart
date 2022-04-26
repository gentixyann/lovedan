import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { uninitialized, authenticated, authenticating, unauthenticated }

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth;
  User? _user;
  Status _status = Status.uninitialized;

  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_authStateChanges);
  }

  User? get user => _user;
  FirebaseAuth get auth => _auth;
  Status get status => _status;

  Future<void> signInAnonymously() async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInAnonymously().then((UserCredential userCredential) {
        _user = userCredential.user;
        FirebaseFirestore.instance.collection('users').doc(_user?.uid).set({
          'uid': _user?.uid,
          'createdAt': Timestamp.now(),
        });
      });
      _status = Status.authenticated;
      notifyListeners();
    } catch (e) {
      print(e);
      _status = Status.unauthenticated;
      notifyListeners();
    }
  }

  Future<void> _authStateChanges(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.authenticated;
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}
