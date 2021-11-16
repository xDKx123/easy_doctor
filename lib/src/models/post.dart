import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/timestamps.dart';
import 'package:easy_doctor/src/models/upload.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  const PostModel(
      {required this.id,
      required this.creator,
      required this.text,
      required this.comments,
      required this.liked,
      required this.uploads,
      required this.timestamps});

  final PostID id;
  final UserID creator;
  final String text;
  final List<CommentModel> comments;
  final List<UserID> liked;
  final List<UploadModel> uploads;
  final TimestampsModel timestamps;

  PostModel copyWith(
      {final PostID? id,
      final UserID? creator,
      final String? text,
      final List<CommentModel>? comments,
      final List<UserID>? liked,
      final List<UploadModel>? uploads,
      final TimestampsModel? timestamps}) {
    return PostModel(
        id: id ?? this.id,
        creator: creator ?? this.creator,
        text: text ?? this.text,
        comments: this.comments,
        liked: liked ?? this.liked,
        uploads: uploads ?? this.uploads,
        timestamps: timestamps ?? this.timestamps);
  }

  @override
  List<Object?> get props => [id, creator, text, comments, liked, timestamps];
}

class PostID extends ID {
  const PostID(String id) : super(id);
}
