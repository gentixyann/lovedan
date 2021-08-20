import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('サインアウト'),
          onPressed: () {
            authService.signOut();
          },
        ),
      ),
    );
  }
}
