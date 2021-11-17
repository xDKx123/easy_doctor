import 'package:email_validator/email_validator.dart';

class Validators {
  static bool emailValidator(String? email) {
    if (email == null) {
      return false;
    }
    return EmailValidator.validate(email);
  }

  static bool notEmptyValidator(String input) {
    return input.isNotEmpty;
  }

  static bool passwordValidator(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }

    String expression =
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";

    RegExp regex = RegExp(expression);

    //return regex.hasMatch(input);
    return true;
  }
}
