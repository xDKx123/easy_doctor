import 'package:easy_doctor/src/blocs/comments_bloc/comments_bloc.dart';
import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/ui/widgets/comments/comments_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  State<StatefulWidget> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    /*if (BlocProvider.of<CommentsBloc>(context).state is CommentsNotLoaded) {
      BlocProvider.of<CommentsBloc>(context)
          .add(LoadComments(postID: widget.post.id));
    }*/

    BlocProvider.of<CommentsBloc>(context)
        .add(LoadComments(postID: widget.post.id));

    return BlocListener<CommentsBloc, CommentsState>(
      listener: (BuildContext context, CommentsState state) {
/*        if (state is CommentsLoaded) {
          //widget.post.comments.clear();

          widget.post.comments.addAll(state.comments);
        }*/
      },
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (BuildContext context, CommentsState state) {
          return CommentsList(
            comments: state is CommentsLoaded ? widget.post.comments : [],
            post: widget.post,
            isLoading: state is CommentsLoading,
          );
          /*return PostsList(
            posts: state is PostsLoaded ? state.posts : [],
            isLoading: state is PostsLoading,
            errorMessage: state is PostsNotLoaded ? state.message : null,
          );*/
        },
      ),
    );
    //return CommentsList(post: widget.post);
  }
}
