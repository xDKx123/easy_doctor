part of 'all_chat_bloc.dart';

abstract class AllChatEvent extends Equatable {
  const AllChatEvent();
}

class LoadAllChat extends AllChatEvent {
  const LoadAllChat();

  @override
  List<Object?> get props => <Object?>[];
}

class RefreshAllChat extends AllChatEvent {
  const RefreshAllChat();

  @override
  List<Object?> get props => <Object?>[];
}

class LoadAdditionalAllChat extends AllChatEvent {
  const LoadAdditionalAllChat({required this.offset});

  final int offset;

  @override
  List<Object?> get props => <Object?>[offset];
}
