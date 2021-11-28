import 'package:easy_doctor/src/mock/profile_mock.dart';
import 'package:easy_doctor/src/models/user.dart';

class ProfileRepository {
  Future<UserModel> getLoggedUser() async {
    return loggedUser;
  }
}
