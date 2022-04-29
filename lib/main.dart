import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lovedan/config/config.dart';
import 'package:lovedan/providers/user_provider.dart';
import 'package:lovedan/responsive/mobile_screen_layout.dart';
import 'package:lovedan/responsive/responsive_layout.dart';
import 'package:lovedan/responsive/web_screen_layout.dart';
import 'package:lovedan/screens/introduction/introduction_screen.dart';
import 'package:lovedan/utils/colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // webの場合
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: apiKey,
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
          storageBucket: storageBucket),
    );
  } else {
    // アプリの場合
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          )
        ],
        child: MaterialApp(
          title: 'LoveDan',
          theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: mobileBackgroundColor,
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                fontFamily: 'NotoSansJP-Regular',
              ))),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Checking if the snapshot has any data or not
                if (snapshot.hasData) {
                  // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                  return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              // means connection to future hasnt been made yet
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return IntroductionScreen();
            },
          ),
        ));
  }
}
