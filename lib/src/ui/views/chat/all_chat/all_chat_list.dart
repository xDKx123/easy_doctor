import 'package:easy_doctor/src/blocs/all_chat_bloc/all_chat_bloc.dart';
import 'package:easy_doctor/src/models/chat_model.dart';
import 'package:easy_doctor/src/ui/views/chat/all_chat/all_chat_list_item.dart';
import 'package:easy_doctor/src/ui/widgets/app_drawer/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatList extends StatefulWidget {
  const AllChatList(
      {Key? key,
      required this.chats,
      required this.isLoading,
      this.errorMessage})
      : super(key: key);

  final List<ChatModel> chats;
  final bool isLoading;
  final String? errorMessage;

  @override
  State<StatefulWidget> createState() => _AllChatList();
}

class _AllChatList extends State<AllChatList> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget buildMainContext() {
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
              color: Theme.of(context).scaffoldBackgroundColor,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Container(
                //color: Colors.blue[100 * (index % 9 + 1)],
                alignment: Alignment.center,
                child: AllChatListItem(chat: widget.chats.elementAt(index)),
              ),
            );
          },
          childCount: widget.chats.length, // 1000 list items
        ),
      );
    }

    return Scaffold(
      key: _drawerKey,
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<AllChatBloc>(context).add(const LoadAllChat());
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (_scrollController.position.pixels ==
                  _scrollController.position.maxScrollExtent) {
                debugPrint("reach the top");

                BlocProvider.of<AllChatBloc>(context).add(
                  const LoadAdditionalAllChat(
                    offset: 0,
                  ),
                );
              }
            }

            return false;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Chats'),
                ),
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
              buildMainContext(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('New chat'),
        icon: const Icon(Icons.add),
        //backgroundColor: Colors.pink,
      ),
      drawer: const AppDrawer(),
    );
  }
}
