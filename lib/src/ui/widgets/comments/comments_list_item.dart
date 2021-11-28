import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';

class CommentsListItem extends StatelessWidget {
  const CommentsListItem({Key? key, required this.comment}) : super(key: key);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    Widget _buildImages() {
      if (comment.uploads.isEmpty) {
        return Container();
      }

      return Container(
        child: Image.network(comment.uploads[0].data),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceTiny,
        Text(comment.userId.toString()),
        verticalSpaceSmall,
        Text(comment.text),
        verticalSpaceTiny,
        _buildImages(),
        verticalSpaceMedium,
      ],
    );
  }
}
