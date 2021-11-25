import 'package:easy_doctor/src/models/post.dart';
import 'package:flutter/cupertino.dart';

class PostsListItem extends StatelessWidget {
  const PostsListItem({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('Create post object');
    return Text(post.text);
    /*return Stack(
      children: [
        Text(post.text),
        verticalSpaceSmall,
      ],
    );*/
  }
}
/*
class PostsListItem extends StatefulWidget {
  const PostsListItem({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  State<StatefulWidget> createState() => _PostsListItem();
}

class _PostsListItem extends State<PostsListItem> {
  @override
  Widget build(BuildContext context) {
    //return Text(widget.post.text);
    return Stack(
      children: [
        Text(widget.post.text),
        verticalSpaceSmall,
      ],
    );
  }
}
*/
