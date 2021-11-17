import 'package:easy_doctor/generated/l10n.dart';
import 'package:easy_doctor/src/views/login/forms/email_input.dart';
import 'package:easy_doctor/src/views/login/forms/login_form.dart';
import 'package:easy_doctor/src/views/login/forms/password_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginForm loginForm = LoginForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).loginView),
      ),
      body: Column(
        children: <Widget>[
          EmailInput(loginForm: loginForm),
          PasswordInput(loginForm: loginForm),
        ],
      ),
    );
  }
}
