import 'package:flutter/material.dart';
import 'package:lovedan/utils/colors.dart';

class ModalTop extends StatelessWidget {
  const ModalTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
