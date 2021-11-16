import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/timestamps.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  const CommentModel(
      {required this.id,
      required this.userId,
      required this.comment,
      required this.liked,
      required this.timestamps});

  final CommentID id;
  final UserID userId;
  final String comment;
  final List<UserID> liked;
  final TimestampsModel timestamps;

  CommentModel copyWith({
    final CommentID? id,
    final UserID? userId,
    final String? comment,
    final List<UserID>? liked,
    final TimestampsModel? timestamps,
  }) {
    return CommentModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        liked: liked ?? this.liked,
        timestamps: timestamps ?? this.timestamps);
  }

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[id, userId, comment, liked, timestamps];
}

class CommentID extends ID {
  const CommentID(String id) : super(id);
}
