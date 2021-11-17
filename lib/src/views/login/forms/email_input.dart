import 'package:easy_doctor/src/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.loginForm}) : super(key: key);

  final LoginForm loginForm;

  String? validator(String? value) {
    if (Validators.emailValidator(value)) {
      return 'Enter valid email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Email'),
        TextFormField(
          initialValue: loginForm.email,
          validator: (String? value) => validator(value),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            loginForm.email = value;
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
          ),
        )
      ],
    );
  }
}
