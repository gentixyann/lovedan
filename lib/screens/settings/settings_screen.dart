import 'package:flutter/material.dart';
import 'package:lovedan/resources/auth_methods.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  void signOut() async {
    await AuthMethods().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('サインアウト'),
          onPressed: signOut,
        ),
      ),
    );
  }
}
