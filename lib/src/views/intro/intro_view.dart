import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Text('Powered by'),
          Text('Some company'),
        ],
      ),
    );
  }
}
