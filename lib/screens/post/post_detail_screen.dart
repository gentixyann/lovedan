import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovedan/config/size_config.dart';

class PostDetailScreen extends StatelessWidget {
  final snap;
  const PostDetailScreen({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    SizeConfig().init(context);
    return Center(
      child: Text(
        snap['description'].toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
