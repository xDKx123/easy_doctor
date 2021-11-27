import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/ui/widgets/comments/comments_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  State<StatefulWidget> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    return CommentsList(post: widget.post);
  }
}
