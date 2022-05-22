import 'package:flutter/material.dart';
import 'package:lovedan/screens/add_post/background.dart';
import 'package:lovedan/screens/post/post_screen.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'add post screen',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostScreen(),
                          fullscreenDialog: true,
                        )),
                    icon: const Icon(Icons.question_answer))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
