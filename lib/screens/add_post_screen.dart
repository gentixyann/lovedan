import 'package:flutter/material.dart';
import 'package:lovedan/screens/post/post_screen.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostScreen(),
                      )),
                  icon: const Icon(Icons.question_answer))
            ],
          ),
        ),
      ),
    );
  }
}
