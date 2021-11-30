part of 'chat_messages_bloc.dart';

abstract class ChatMessagesState extends Equatable {
  const ChatMessagesState();
}

class ChatMessagesLoading extends ChatMessagesState {
  const ChatMessagesLoading();

  @override
  List<Object?> get props => <Object?>[];
}

class ChatMessagesLoaded extends ChatMessagesState {
  const ChatMessagesLoaded({required this.chatMessages});

  final List<ChatMessageModel> chatMessages;

  @override
  List<Object?> get props => <Object?>[chatMessages];

  @override
  String toString() => '"ChatMessagesLoaded": {"chatMessages": $chatMessages}';
}

class ChatMessagesAdditionalLoading extends ChatMessagesState {
  const ChatMessagesAdditionalLoading();

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[];
}

class ChatMessagesAdditionalLoaded extends ChatMessagesState {
  const ChatMessagesAdditionalLoaded({required this.chatMessages});

  final List<ChatMessageModel> chatMessages;

  @override
  List<Object?> get props => <Object?>[chatMessages];

  @override
  String toString() =>
      '"ChatMessagesAdditionalLoaded": {"chatMessages": $chatMessages}';
}

class ChatMessagesNotLoaded extends ChatMessagesState {
  const ChatMessagesNotLoaded();
  @override
  List<Object?> get props => <Object?>[];
}
