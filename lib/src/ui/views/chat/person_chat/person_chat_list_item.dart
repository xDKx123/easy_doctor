import 'package:easy_doctor/src/models/chat_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonChatListItem extends StatelessWidget {
  const PersonChatListItem(
      {Key? key, required this.isMe, required this.message})
      : super(key: key);

  final bool isMe;
  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Color color =
        isMe ? Theme.of(context).canvasColor : Theme.of(context).cardColor;
    final BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: color);
    final EdgeInsets margin = EdgeInsets.fromLTRB(
        isMe ? width * 0.2 : 20, 10, isMe ? 5 : width * 0.2, 20);

    return Container(
      decoration: boxDecoration,
      padding: const EdgeInsets.all(15),
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(
              message.message,
            ),
          ),
        ],
      ),
    );
  }
}
