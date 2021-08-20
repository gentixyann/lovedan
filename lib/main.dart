import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './config/hex_color.dart';
import './screens/top_screen.dart';
import './screens/tabs_screen.dart';
import './screens/my_questions/my_questions_screen.dart';
import './screens/post_question/post_question_screen.dart';
import './screens/settings/settings_screen.dart';
import './screens/introduction/introduction_screen.dart';
import './services/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('読み込みでエラー発生' + snapshot.error),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyHomePage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService.instance(),
        )
      ],
      child: MaterialApp(
        title: 'LoveDan',
        theme: ThemeData(
          primaryColor: HexColor('F8EEF4'),
          accentColor: Colors.yellow[100],
          textTheme: TextTheme(
            headline5: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'KiwiMaru-Regular'),
            headline6: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'KiwiMaru-Regular'),
            bodyText1: TextStyle(
              fontSize: 16.0,
              fontFamily: 'KiwiMaru-Regular',
            ),
            bodyText2: TextStyle(fontSize: 14.0),
          ),
        ),
        home: StreamBuilder<User>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.active) {
                User user = userSnapshot.data;
                if (user == null) {
                  return IntroductionScreen();
                }
                return TabsScreen();
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
        routes: {
          TopScreen.routeName: (ctx) => TopScreen(),
          MyQuestionsScreen.routeName: (ctx) => MyQuestionsScreen(),
          PostQuestionScreen.routeName: (ctx) => PostQuestionScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}
