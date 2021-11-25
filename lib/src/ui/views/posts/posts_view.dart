import 'package:easy_doctor/src/blocs/posts_bloc/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocListener<PostsBloc, PostsState>(
        listener: (BuildContext context, PostsState state) {},
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (BuildContext context, PostsState state) {
            return Container();
          },
        ),
      ),
    );
  }
}
