import 'package:easy_doctor/src/blocs/chat_messages/chat_messages_bloc.dart';
import 'package:easy_doctor/src/models/chat.dart';
import 'package:easy_doctor/src/ui/views/chat/person_chat/person_chat_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonChatView extends StatefulWidget {
  const PersonChatView({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  State<StatefulWidget> createState() => _PersonChatView();
}

class _PersonChatView extends State<PersonChatView> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatMessagesBloc>(context).add(
      LoadChatMessages(
        userID: widget.chat.interlocutor.id,
      ),
    );

/*    final ChatMessagesState state = BlocProvider.of<ChatMessagesBloc>(context).state;
    if (state is ChatMessagesAdditionalLoaded) {
      widget.chat.chatMessages.addAll(state.chatMessages);
    }*/

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocConsumer<ChatMessagesBloc, ChatMessagesState>(
        listener: (BuildContext context, ChatMessagesState state) {
          if (state is ChatMessagesLoaded) {
            widget.chat.chatMessages.clear();
            widget.chat.chatMessages.addAll(state.chatMessages);
          } else if (state is ChatMessagesAdditionalLoaded) {
            widget.chat.chatMessages.addAll(state.chatMessages);
          }
        },
        builder: (BuildContext context, ChatMessagesState state) {
          return PersonChatList(
            user: widget.chat.interlocutor,
            chatMessages: widget.chat.chatMessages,
            isLoading: state is ChatMessagesLoading,
          );
        },
      ),
    );
  }
}
