import 'package:easy_doctor/src/blocs/chat_messages/chat_messages_bloc.dart';
import 'package:easy_doctor/src/blocs/profile_bloc/profile_bloc.dart';
import 'package:easy_doctor/src/models/chat_message.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:easy_doctor/src/ui/views/chat/person_chat/person_chat_list_item.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonChatList extends StatefulWidget {
  const PersonChatList(
      {Key? key,
      required this.chatMessages,
      required this.isLoading,
      required this.user})
      : super(key: key);

  final List<ChatMessageModel> chatMessages;
  final UserModel user;
  final bool isLoading;

  @override
  State<StatefulWidget> createState() => _PersonChatList();
}

class _PersonChatList extends State<PersonChatList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<ProfileBloc>(context).state is ProfileNotLoaded) {
      BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    }

    Widget buildMainContext() {
      if (widget.isLoading) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState profileState) {
          if (BlocProvider.of<ProfileBloc>(context).state is ProfileNotLoaded) {
            BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final bool isMe = profileState is ProfileLoaded
                    ? profileState.user.id.toString() ==
                        widget.chatMessages.elementAt(index).id.toString()
                    : false;

                return PersonChatListItem(
                  isMe: isMe,
                  message: widget.chatMessages.elementAt(index),
                );
              },
              childCount: widget.chatMessages.length, // 1000 list items
            ),
          );
        },
      );
    }

    Widget bottomWidgets() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera)),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    hintText: 'Enter message',
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.user.profileImageUrl,
                //width: 60,
              ),
            ),
            horizontalSpaceTiny,
            Text(widget.user.name + ' ' + widget.user.surname)
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollEndNotification) {
                  if (_scrollController.position.pixels ==
                      _scrollController.position.maxScrollExtent) {
                    BlocProvider.of<ChatMessagesBloc>(context).add(
                        LoadAdditionalMessages(
                            offset: 0,
                            userID: widget.user.id,
                            chatMessages: widget.chatMessages));
                  }
                }

                return false;
              },
              child: CustomScrollView(
                reverse: true,
                controller: _scrollController,
                slivers: <Widget>[
                  buildMainContext(),
                ],
              ),
            ),
          ),
          bottomWidgets(),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
