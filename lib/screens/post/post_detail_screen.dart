import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovedan/config/size_config.dart';
import 'package:lovedan/utils/colors.dart';
import 'package:lovedan/widgets/comments/comments_modal.dart';

class PostDetailScreen extends StatelessWidget {
  final snap;
  const PostDetailScreen({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/splash.png',
          width: 40,
          height: 40,
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 5,
                vertical: SizeConfig.blockSizeVertical! * 5,
              ),
              child: Text(
                snap['title'].toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 5,
                vertical: SizeConfig.blockSizeVertical! * 3,
              ),
              child: Text(
                snap['description'].toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.access_time,
                  size: 20,
                  color: grayColor,
                ),
                Text(
                  outputFormat.format(snap['datePublished'].toDate()),
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.comment,
                  size: 30,
                ),
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => CommentsModal(
                    postId: snap['postId'].toString(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
