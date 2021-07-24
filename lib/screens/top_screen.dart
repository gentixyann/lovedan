import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  static const routeName = '/top';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Row(
            children: <Widget>[
              Container(
                child: Text('Title'),
              ),
              Container(
                child: Text('text'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
