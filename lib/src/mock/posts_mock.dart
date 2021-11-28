import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/models/upload.dart';
import 'package:easy_doctor/src/models/user.dart';

import 'comments_mock.dart';

List<PostModel> postsMock = <PostModel>[
  PostModel(
      id: PostID('Id'),
      creator: UserID('1'),
      title: 'Ttile 1',
      text: "test 1",
      comments: commentsMock,
      liked: <UserID>[],
      uploads: <UploadModel>[],
      allComments: 5,
      allLikes: 5,
      timestamps: timestampsModelMock),
  PostModel(
      id: PostID('2'),
      creator: UserID('1'),
      title: 'Title 2',
      text: "test 2",
      comments: commentsMock,
      liked: <UserID>[],
      uploads: <UploadModel>[],
      allComments: 5,
      allLikes: 5,
      timestamps: timestampsModelMock)
];
