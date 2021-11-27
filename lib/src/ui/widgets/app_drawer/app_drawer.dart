import 'package:easy_doctor/src/app/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  List<Widget> getDrawerItems(BuildContext context) {
    return <Widget>[
      Container(
        height: MediaQuery.of(context).size.width * 0.2,
      ),
      DrawerItem(
          onPressed: () {
            Navigator.of(context).pushNamed(postsRoute);
          },
          icon: Icons.add,
          title: 'Posts'),
      DrawerItem(
          onPressed: () {
            Navigator.of(context).pushNamed(settingsRoute);
            /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsView()));*/
          },
          icon: Icons.settings,
          title: 'Settings'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: 250,
      //color: Colors.black,
      //width: 150,
      //height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: getDrawerItems(context),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.title})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton.icon(
        onPressed: onPressed, icon: Icon(icon), label: Text(title));
  }
}
