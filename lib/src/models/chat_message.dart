import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/timestamps.dart';
import 'package:easy_doctor/src/models/upload.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:equatable/equatable.dart';

class ChatMessageModel extends Equatable {
  const ChatMessageModel({
    required this.id,
    required this.interlocutor,
    required this.message,
    required this.uploads,
    required this.timestamps,
  });

  final ChatMessageID id;
  final UserID interlocutor;
  final String message;
  final List<UploadModel> uploads;
  final TimestampsModel timestamps;

  ChatMessageModel copyWith({
    final ChatMessageID? id,
    final UserID? interlocutor,
    final String? message,
    final List<UploadModel>? uploads,
    final TimestampsModel? timestamps,
  }) {
    return ChatMessageModel(
        id: id ?? this.id,
        interlocutor: interlocutor ?? this.interlocutor,
        message: message ?? this.message,
        uploads: uploads ?? this.uploads,
        timestamps: timestamps ?? this.timestamps);
  }

  @override
  List<Object?> get props =>
      <Object?>[id, interlocutor, message, uploads, timestamps];
}

class ChatMessageID extends ID {
  const ChatMessageID(String id) : super(id);
}
