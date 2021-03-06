import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/timestamps_model.dart';
import 'package:easy_doctor/src/models/upload_model.dart';
import 'package:easy_doctor/src/models/user_model.dart';
import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  const CommentModel(
      {required this.id,
      required this.user,
      required this.text,
      required this.liked,
      required this.uploads,
      required this.timestamps});

  final CommentID id;
  final UserModel user;
  final String text;
  final List<UserID> liked;
  final List<UploadModel> uploads;
  final TimestampsModel timestamps;

  CommentModel copyWith({
    final CommentID? id,
    final UserModel? user,
    final String? text,
    final List<UserID>? liked,
    final List<UploadModel>? uploads,
    final TimestampsModel? timestamps,
  }) {
    return CommentModel(
        id: id ?? this.id,
        user: user ?? this.user,
        text: text ?? this.text,
        liked: liked ?? this.liked,
        uploads: uploads ?? this.uploads,
        timestamps: timestamps ?? this.timestamps);
  }

  @override
  List<Object?> get props =>
      <Object?>[id, user, text, liked, uploads, timestamps];
}

class CommentID extends ID {
  const CommentID(String id) : super(id);
}
