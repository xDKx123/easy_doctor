import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/ui/widgets/comments/comments_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatefulWidget {
  final PostModel post;
  final bool isLoading;
  final List<CommentModel> comments;

  const CommentsList(
      {Key? key,
      required this.post,
      required this.isLoading,
      required this.comments})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommentsList();
}

class _CommentsList extends State<CommentsList> {
  /*

  const CommentsList({Key? key, required this.post}) : super(key: key);
*/
  Widget _buildBody() {
    if (widget.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (widget.post.comments.isEmpty) {
      return const SliverFillRemaining(
        child: Text('No comments'),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: Container(
              color: Colors.blue[100 * (index % 9 + 1)],
              //height: 80,
              alignment: Alignment.center,
              child: CommentsListItem(
                comment: widget.post.comments.elementAt(index),
              ),
            ),
          );
        },
        childCount: widget.post.comments.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          _buildBody(),
        ],
      ),
    );
  }
}
