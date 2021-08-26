import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/my_questions/my_questions_screen.dart';
import '../screens/top_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../services/auth_service.dart';
import '../services/question_service.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': TopScreen(),
        'title': 'Top',
      },
      {
        'page': MyQuestionsScreen(),
        'title': 'MyQuestions',
      },
      {
        'page': SettingsScreen(),
        'title': 'Settings',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final questionService =
        Provider.of<QuestionService>(context, listen: false);
    questionService.uid = authService.user.uid;
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.question_answer_outlined),
            label: 'My Questions',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
