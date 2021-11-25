import 'package:easy_doctor/generated/l10n.dart';
import 'package:easy_doctor/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forms/email_input.dart';
import 'forms/login_form.dart';
import 'forms/password_input.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EmailInput(loginForm: loginForm),
          PasswordInput(loginForm: loginForm),
          verticalSpaceSmall,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            //height: MediaQuery.of(context).size.height * ,
            child: ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LoginSubmitted(email: 'test', password: 'test'));
              },
              child: const Text('Login'),
            ),
          ),
          verticalSpaceSmall,
          TextButton(
              onPressed: () async {}, child: const Text('forgot password?'))
        ],
      ),
    );
  }
}
