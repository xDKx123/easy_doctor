import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/ui/widgets/comments/comments_view.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsListItem extends StatelessWidget {
  const PostsListItem({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    Widget _buildImages() {
      if (post.uploads.isEmpty) {
        return Container();
      }

      //TODO: implement images view;
      return Container();
    }

    Widget _buildBottom() {
      String commentsLabel = 'Comments (' + post.allComments.toString() + ')';
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*TextButton(
              onPressed: () {},
              child: Text('Liked'),
            ),*/
              TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentsView(post: post)),
                    );
                  },
                  child: Text(commentsLabel)),
/*            Text('test'),
            Text('test'),
            Text('test'),
            Text('test'),*/
            ],
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        verticalSpaceSmall,
        Text(
          post.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        verticalSpaceMedium,
        Text(post.text),
        verticalSpaceTiny,
        _buildImages(),
        verticalSpaceSmall,
        _buildBottom(),
        //verticalSpaceSmall,
      ],
    );
  }
}
