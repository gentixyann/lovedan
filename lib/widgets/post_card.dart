import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovedan/config/size_config.dart';
import 'package:lovedan/screens/post/post_detail_screen.dart';
import 'package:lovedan/utils/colors.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

void _selectedPost(BuildContext ctx, dynamic snap) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (ctx) => PostDetailScreen(
        snap: snap,
      ),
    ),
  );
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    SizeConfig().init(context);
    return InkWell(
      splashColor: secondaryColor,
      onTap: () => _selectedPost(context, widget.snap),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.blockSizeVertical! * 27,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  widget.snap['title'].toString(),
                  style: Theme.of(context).textTheme.headline6,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
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
                    outputFormat.format(widget.snap['datePublished'].toDate()),
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
