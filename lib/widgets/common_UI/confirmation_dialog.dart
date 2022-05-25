import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'AlertDialog Title',
        style: Theme.of(context).textTheme.headline6,
      ),
      content: Text('AlertDialog description',
          style: Theme.of(context).textTheme.bodyText1),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'OK');
            print('送信だ！！！');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
