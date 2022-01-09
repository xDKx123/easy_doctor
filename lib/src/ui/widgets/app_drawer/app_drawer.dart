import 'package:easy_doctor/src/app/routes/route_names.dart';
import 'package:easy_doctor/src/blocs/profile_bloc/profile_bloc.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<ProfileBloc>(context).state is ProfileNotLoaded) {
      BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    }

    Widget profileBuilder(ProfileState state) {
      if (state is ProfileLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ProfileLoaded) {
        return InkWell(
          onTap: () async {},
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.4,
            //margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
            //height: MediaQuery.of(context).size.height * 0.15,
            /*decoration: const BoxDecoration(
              color: Colors.grey,
            ),*/
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    state.user.profileImageUrl,
                    //width: 60,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Text(state.user.name + ' ' + state.user.surname),
                ),
              ],
            ),
          ),
        );
      }

      return Container();
    }

    List<Widget> getDrawerItems(ProfileState state) {
      return <Widget>[
        verticalSpaceLarge,
        profileBuilder(state),
        verticalSpaceMedium,
        DrawerItem(
          onPressed: () {
            Navigator.of(context).popAndPushNamed(chatsRoute);
          },
          icon: Icons.chat,
          title: 'Chats',
        ),
        DrawerItem(
          onPressed: () {
            Navigator.of(context).popAndPushNamed(postsRoute);
          },
          icon: Icons.home,
          title: 'Posts',
        ),
        DrawerItem(
          onPressed: () {
            Navigator.of(context).popAndPushNamed(medicalRecordRoute);
          },
          icon: Icons.insert_drive_file_outlined,
          title: 'My medical record',
        ),
        DrawerItem(
          onPressed: () {
            Navigator.of(context).popAndPushNamed(personalListRoute);
          },
          icon: Icons.list,
          title: 'Personal lists',
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DrawerItem(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(settingsRoute);
              },
              icon: Icons.settings,
              title: 'Settings',
            ),
          ),
        ),
        verticalSpaceSmall,
      ];
    }

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return Drawer(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: getDrawerItems(state),
            ),
          ),
        );
      },
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
