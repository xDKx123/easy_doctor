import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel({
    required this.id,
    required this.interlocutor,
  });

  final ChatID id;
  final UserID interlocutor;

  ChatModel copyWith({
    final ChatID? id,
    final UserID? interlocutor,
  }) {
    return ChatModel(
        id: id ?? this.id, interlocutor: interlocutor ?? this.interlocutor);
  }

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[id, interlocutor];
}

class ChatID extends ID {
  const ChatID(String id) : super(id);
}
