import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/models/user_model.dart';

UserModel loggedUser = UserModel(
    id: UserID('1'),
    email: "test@test.si",
    name: 'Test name',
    surname: 'test surname',
    status: UserStatus.user,
    profileImageUrl: 'https://i.stack.imgur.com/l60Hf.png',
    timestamps: timestampsModelMock);
