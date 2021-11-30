import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/models/user.dart';

UserModel userMock = UserModel(
    id: UserID('1'),
    email: 'test@test.si',
    name: 'Janez',
    surname: 'Novak',
    status: UserStatus.user,
    profileImageUrl: 'https://i.stack.imgur.com/l60Hf.png',
    timestamps: timestampsModelMock);
