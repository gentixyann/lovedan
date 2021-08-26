import 'package:flutter/material.dart';

class ViewComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Text('削除要請とか'),
            Divider(
              thickness: 1,
              color: Colors.grey,
              height: 5,
            ),
            Text('回答の内容'),
          ],
        ),
      ),
    );
  }
}
