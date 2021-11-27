import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';

class CommentsListItem extends StatelessWidget {
  const CommentsListItem({Key? key, required this.comment}) : super(key: key);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        verticalSpaceSmall,
        Text(comment.text),
      ],
    );
  }
}
