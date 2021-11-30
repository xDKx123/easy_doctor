import 'package:easy_doctor/src/models/chat_message.dart';
import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel({
    required this.id,
    required this.interlocutor,
    required this.chatMessages,
  });

  final ChatID id;
  final UserModel interlocutor; //Sogovornik
  final List<ChatMessageModel> chatMessages;

  ChatModel copyWith({
    final ChatID? id,
    final UserModel? interlocutor,
    final List<ChatMessageModel>? chatMessages,
  }) {
    return ChatModel(
        id: id ?? this.id,
        interlocutor: interlocutor ?? this.interlocutor,
        chatMessages: chatMessages ?? this.chatMessages);
  }

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[id, interlocutor, chatMessages];
}

class ChatID extends ID {
  const ChatID(String id) : super(id);
}
