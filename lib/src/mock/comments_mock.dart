import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/mock/uploads_mock.dart';
import 'package:easy_doctor/src/mock/user_mock.dart';
import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/models/upload.dart';
import 'package:easy_doctor/src/models/user.dart';

List<CommentModel> commentsMock = <CommentModel>[
  CommentModel(
      id: CommentID('1'),
      user: userMock,
      text: 'TestComment1',
      liked: <UserID>[],
      uploads: listUploadsMock,
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('2'),
      user: userMock,
      text: 'TestComment2',
      liked: <UserID>[],
      uploads: <UploadModel>[],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('3'),
      user: userMock,
      text: 'TestComment3',
      liked: <UserID>[],
      uploads: <UploadModel>[],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('4'),
      user: userMock,
      text: 'TestComment4',
      liked: <UserID>[],
      uploads: <UploadModel>[],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('5'),
      user: userMock,
      text: 'TestComment5',
      liked: <UserID>[],
      uploads: <UploadModel>[],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('6'),
      user: userMock,
      text: 'TestComment6',
      liked: <UserID>[],
      uploads: <UploadModel>[],
      timestamps: timestampsModelMock)
];
