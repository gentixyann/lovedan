import 'package:flutter/material.dart';
import 'package:lovedan/resources/auth_methods.dart';
import 'package:lovedan/responsive/mobile_screen_layout.dart';
import 'package:lovedan/responsive/responsive_layout.dart';
import 'package:lovedan/responsive/web_screen_layout.dart';
import 'package:lovedan/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  void signInAnonymously() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signInAnonymously();
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ),
      ));
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('はじめる'),
          onPressed: signInAnonymously,
        ),
      ),
    );
  }
}
