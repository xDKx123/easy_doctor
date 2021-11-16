import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.initialValue}) : super(key: key);

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Email'),
        TextFormField(
          initialValue: initialValue,
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
