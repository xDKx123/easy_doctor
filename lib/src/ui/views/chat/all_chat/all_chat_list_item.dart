import 'package:easy_doctor/src/models/chat.dart';
import 'package:easy_doctor/src/ui/views/chat/person_chat/person_chat_view.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllChatListItem extends StatefulWidget {
  const AllChatListItem({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  State<StatefulWidget> createState() => _AllChatListItem();
}

class _AllChatListItem extends State<AllChatListItem> {
  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget errorBuilder(
      BuildContext context, Object error, StackTrace? stackTrace) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                PersonChatView(chat: widget.chat),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                'https://picsum.photos/250?image=9',
                width: 70,
                loadingBuilder: loadingBuilder,
                errorBuilder: errorBuilder,
              ),
              horizontalSpaceSmall,
              Column(
                children: [
                  Text(widget.chat.interlocutor.name +
                      ' ' +
                      widget.chat.interlocutor.surname),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
