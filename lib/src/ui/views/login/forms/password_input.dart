import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.loginForm}) : super(key: key);

  final LoginForm loginForm;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const Text('Password'),
        TextFormField(
          initialValue: loginForm.password,
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            //email = value;
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
          ),
        )
      ],
    );
  }
}
