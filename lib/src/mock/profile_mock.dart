import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/models/user.dart';

UserModel loggedUser = UserModel(
    id: UserID('1'),
    email: "test@test.si",
    name: 'Test name',
    surname: 'test surname',
    status: UserStatus.user,
    profileImageUrl: '',
    timestamps: timestampsModelMock);
