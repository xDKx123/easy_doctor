import 'package:easy_doctor/src/blocs/posts_bloc/posts_bloc.dart';
import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/ui/views/posts/posts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatefulWidget {
  const PostsList(
      {Key? key,
      required this.posts,
      required this.isLoading,
      this.errorMessage})
      : super(key: key);

  final List<PostModel> posts;
  final bool isLoading;
  final String? errorMessage;

  @override
  State<StatefulWidget> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final ScrollController _scrollController = ScrollController();
  //final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  Widget buildMainContext() {
    print(widget.posts.length);
    if (widget.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: Container(
              color: Colors.blue[100 * (index % 9 + 1)],
              height: 80,
              alignment: Alignment.center,
              child: PostsListItem(post: widget.posts[index]),
            ),
          );
        },
        childCount: widget.posts.length, // 1000 list items
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<PostsBloc>(context).add(LoadPosts());
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Posts list'),
              ),
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ),
            buildMainContext(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('New post'),
        icon: const Icon(Icons.add),
        //backgroundColor: Colors.pink,
      ),
    );
    /*return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          print('Refresh');
        },
        child: CustomScrollView(
          //key: _listKey,
          slivers: [

          ],
*/ /*          itemBuilder: (context, index, animation) =>
              PostsListItem(post: widget.posts[index]),
          shrinkWrap: true,*/ /*
        ),
      ),
    );*/
/*    return SmartList<PostModel>(
      itemBuilder: (data) => Text(data.text),
      scrollController: _scrollController,
      createForm: Container(),
      isLoadingItems: widget.isLoading,
      errorMessage: widget.errorMessage,
      items: widget.posts,
      createButton: TextButton(
        child: Text('Create'),
        onPressed: () {},
      ),
      onRefresh: () {},
    );*/
  }
}
