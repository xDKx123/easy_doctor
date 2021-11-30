part of 'chat_messages_bloc.dart';

abstract class ChatMessagesEvent extends Equatable {
  const ChatMessagesEvent();
}

class LoadChatMessages extends ChatMessagesEvent {
  const LoadChatMessages({required this.userID});

  final UserID userID;

  @override
  List<Object?> get props => <Object?>[userID];
}

class LoadAdditionalMessages extends ChatMessagesEvent {
  const LoadAdditionalMessages(
      {required this.offset, required this.userID, required this.chatMessages});

  final int offset;
  final UserID userID;
  final List<ChatMessageModel> chatMessages;

  @override
  List<Object?> get props => <Object?>[];
}
