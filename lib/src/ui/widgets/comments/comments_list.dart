import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/ui/widgets/comments/comments_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  final PostModel post;

  const CommentsList({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(15),
                  child: Container(
                    color: Colors.blue[100 * (index % 9 + 1)],
                    //height: 80,
                    alignment: Alignment.center,
                    child: CommentsListItem(
                      comment: post.comments.elementAt(index),
                    ),
                  ),
                );
              },
              childCount: post.comments.length,
            ),
          ),
        ],
      ),
    );
  }
}
