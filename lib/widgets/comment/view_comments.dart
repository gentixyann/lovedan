// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import '../../config/size_config.dart';
// import '../../services/comment_service.dart';
// import '../../models/comment_model.dart';

// class ViewComments extends StatelessWidget {
//   CommentModel? _comment;
//   final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
//   DateTime? _date;

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     final commentService = Provider.of<CommentService>(context, listen: false);
//     return Container(
//       height: SizeConfig.blockSizeVertical! * 80,
//       child: StreamBuilder<QuerySnapshot>(
//           stream: commentService.commentsPath
//               .orderBy('createdAt', descending: true)
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return CircularProgressIndicator();
//               default:
//                 // streamからデータを取得できたので、使いやすい形にかえてあげる
//                 commentService.getComments(snapshot.data!.docs);

//                 return ListView.builder(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.only(
//                         top: SizeConfig.blockSizeVertical! * 5,
//                         left: 10,
//                         right: 10),
//                     itemCount: commentService.comments.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       _date = commentService.comments[index].createdAt.toDate();
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             bottom: SizeConfig.blockSizeVertical! * 2),
//                         child: Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 10, horizontal: 10),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Text(
//                                           commentService
//                                               .comments[index].commentedUserName
//                                               .toString(),
//                                           style: TextStyle(color: Colors.grey)),
//                                       Text(' / '),
//                                       Text(
//                                           outputFormat.format(_date).toString(),
//                                           style: TextStyle(color: Colors.grey)),
//                                     ],
//                                   )),
//                               Divider(
//                                 thickness: 1,
//                                 color: Colors.grey,
//                                 height: 5,
//                               ),
//                               Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 15, horizontal: 15),
//                                   child: Text(
//                                     commentService.comments[index].commentText
//                                         .toString(),
//                                     style:
//                                         Theme.of(context).textTheme.bodyText1,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       );
//                     });
//             }
//           }),
//     );
//   }
// }
