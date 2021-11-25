import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/models/user.dart';

List<CommentModel> commentsMock = <CommentModel>[
  CommentModel(
      id: CommentID('1'),
      userId: UserID('1'),
      text: 'TestComment1',
      liked: [],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('2'),
      userId: UserID('1'),
      text: 'TestComment2',
      liked: [],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('3'),
      userId: UserID('1'),
      text: 'TestComment3',
      liked: [],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('4'),
      userId: UserID('1'),
      text: 'TestComment4',
      liked: [],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('5'),
      userId: UserID('1'),
      text: 'TestComment5',
      liked: [],
      timestamps: timestampsModelMock),
  CommentModel(
      id: CommentID('6'),
      userId: UserID('1'),
      text: 'TestComment6',
      liked: [],
      timestamps: timestampsModelMock)
];
