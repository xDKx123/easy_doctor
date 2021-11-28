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
        slivers: [
          SliverAppBar(
            title: GestureDetector(
              onDoubleTap: () async {},
              child: Text('Settings'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildItems()),
          ),
        ],
      ),
    );
  }
}
