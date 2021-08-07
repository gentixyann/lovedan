import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/top_screen.dart';
import './screens/tabs_screen.dart';
import './screens/my_questions/my_questions_screen.dart';
import './screens/post_question/post_question_screen.dart';
import './screens/settings/settings_screen.dart';

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
    return MaterialApp(
      title: 'LoveDan',
      theme: ThemeData(
        primaryColor: Colors.pink[100],
        accentColor: Colors.yellow[100],
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 62.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Yomogi-Regular'),
          headline6: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'KiwiMaru-Regular'),
          bodyText1: TextStyle(fontSize: 14.0),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
      ),
      home: TabsScreen(),
      routes: {
        TopScreen.routeName: (ctx) => TopScreen(),
        MyQuestionsScreen.routeName: (ctx) => MyQuestionsScreen(),
        PostQuestionScreen.routeName: (ctx) => PostQuestionScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
      },
    );
  }
}
