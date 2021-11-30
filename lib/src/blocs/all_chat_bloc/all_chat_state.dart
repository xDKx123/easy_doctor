part of 'all_chat_bloc.dart';

abstract class AllChatState extends Equatable {
  const AllChatState();
}

class AllChatLoading extends AllChatState {
  const AllChatLoading();

  @override
  List<Object?> get props => <Object?>[];
}

class AllChatLoaded extends AllChatState {
  const AllChatLoaded({required this.chats});

  final List<ChatModel> chats;

  @override
  List<Object?> get props => <Object?>[chats];
}

class AllChatNotLoaded extends AllChatState {
  const AllChatNotLoaded({this.message});

  final String? message;

  @override
  List<Object?> get props => <Object?>[message];
}

class AllChatAdditionalLoading extends AllChatState {
  const AllChatAdditionalLoading();

  @override
  List<Object?> get props => <Object?>[];
}

class AllChatAdditionalLoaded extends AllChatState {
  const AllChatAdditionalLoaded({required this.chats});

  final List<ChatModel> chats;

  @override
  List<Object?> get props => <Object?>[chats];
}
