import 'package:easy_doctor/src/blocs/posts_bloc/posts_bloc.dart';
import 'package:easy_doctor/src/ui/views/posts/posts_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<PostsBloc>(context).state is PostsNotLoaded) {
      BlocProvider.of<PostsBloc>(context).add(const LoadPosts());
    }

    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: BlocListener<PostsBloc, PostsState>(
          listener: (BuildContext context, PostsState state) {
            if (state is PostsLoading) {
              //BlocProvider.of<PostsBloc>(context).add(const LoadPosts());
            }
          },
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (BuildContext context, PostsState state) {
              return PostsList(
                posts: state is PostsLoaded ? state.posts : [],
                isLoading: state is PostsLoading,
                errorMessage: state is PostsNotLoaded ? '' : null,
              );
            },
          ),
        ));
  }
}
