import 'package:easy_doctor/src/app/app_drawers/app_drawer.dart';
import 'package:easy_doctor/src/app/utils/device_screen_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceModerate = SizedBox(width: 15.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);
const Widget horizontalSpaceMassive = SizedBox(width: 120.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceModerate = SizedBox(height: 15.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

double getHorizontalAppPadding({SizingInformation? sizingInfo}) {
  if (sizingInfo == null) {
    return 20;
  }

  if (sizingInfo.deviceScreenType == DeviceScreenType.desktop) {
    return 20;
  }

  if (sizingInfo.deviceScreenType == DeviceScreenType.tablet) {
    return 20;
  }

  if (sizingInfo.deviceScreenType == DeviceScreenType.mobile) {
    return 16;
  }

  return 20;
}

const String noValueString = '-';

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

// Takes a key, and in 1 frame, returns the size of the context attached to the key
void getFutureSizeFromGlobalKey(
    {required GlobalKey key, required Function(Size size) callback}) {
  Future.microtask(() {
    final Size size = getSizeFromContext(key.currentContext!);
    if (size != null) {
      callback(size);
    }
  });
}

// Shortcut to get the renderBox size from a context
Size getSizeFromContext(BuildContext context) {
  final RenderBox rb = context.findRenderObject() as RenderBox;
  return rb.size;
}

// Shortcut to get the global position of a context
Offset getOffsetFromContext({required BuildContext context, Offset? offset}) {
  final RenderBox rb = context.findRenderObject() as RenderBox;
  return rb.localToGlobal(offset ?? Offset.zero);
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

NavigatorState? get _navigator => _navigatorKey.currentState;

Future<bool> openDrawerOnPop(BuildContext context) async {
  if (kIsWeb == true) {
    return true;
  } else {
    if (Scaffold.of(context).isDrawerOpen) {
      _navigator!.pop(context);
    } else if (!Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).openDrawer();
    }
    return false;
  }
}
