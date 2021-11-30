import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsListItem extends StatelessWidget {
  const CommentsListItem({Key? key, required this.comment}) : super(key: key);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    Widget _buildImages() {
      if (comment.uploads.isEmpty) {
        return Container();
      }

      return Image.network(comment.uploads[0].data);
    }

    return Card(
      //margin: const EdgeInsets.all(5),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        //color: Colors.blue[100 * (index % 9 + 1)],
        //height: 80,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                comment.user.profileImageUrl,
                //width: 60,
              ),
            ),
            horizontalSpaceMedium,
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Theme.of(context).cardColor),
              //color: Theme.of(context).cardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(comment.user.name + ' ' + comment.user.surname),
                  verticalSpaceTiny,
                  Text(comment.text),
                  verticalSpaceSmall,
                  _buildImages(),
                  //verticalSpaceTiny,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
