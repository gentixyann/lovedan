import 'package:flutter/material.dart';

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  final _snackBar = SnackBar(
    content: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height / 2 - 50,
    ),
  );

  return ScaffoldMessenger.of(context).showSnackBar(_snackBar);
}
