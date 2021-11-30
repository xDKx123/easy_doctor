import 'package:easy_doctor/src/app/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildItems() {
      return <Widget>[];
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: GestureDetector(
              onDoubleTap: () async {},
              child: Text('Settings'),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  await Navigator.pushNamedAndRemoveUntil(
                    context,
                    loginRoute,
                    (Route<dynamic> route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildItems()),
          ),
        ],
      ),
    );
  }
}
