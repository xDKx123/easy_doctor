import 'package:easy_doctor/src/app/routes/route_names.dart';
import 'package:easy_doctor/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:easy_doctor/src/views/intro/intro_view.dart';
import 'package:easy_doctor/src/views/login/login_view.dart';
import 'package:easy_doctor/src/views/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingData {
  const RoutingData({required this.route, required this.queryParameters});

  final String route;
  final Map<String, String> queryParameters;
}

RoutingData getRoutingData(String? name) {
  final Uri? uriData = Uri.tryParse(name!);
  //final Logger _logger = CustomLogger().getLogger();
  //_logger.i('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
  return RoutingData(
    route: uriData!.path,
    queryParameters: uriData.queryParameters,
  );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final RoutingData routingData = getRoutingData(settings.name);

  switch (routingData.route) {
    case splashRoute:
      return _getGuardedPageRoute(const SplashView(), settings);
    case loginRoute:
      return _getGuardedPageRoute(const LoginView(), settings);
    case introRoute:
      return _getGuardedPageRoute(const IntroView(), settings);
    default:
      return _getGuardedPageRoute(const LoginView(), settings);
  }
}

PageRoute _getGuardedPageRoute(Widget child, RouteSettings settings) {
  return GuardedRoute(
    guardedPage: child,
    placeholderPage: const SplashView(),
    routeName: settings.name,
  );
}

Widget _fadeTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

class GuardedRoute extends PageRouteBuilder {
  GuardedRoute({
    required final Widget guardedPage,
    required String? routeName,
    required final Widget placeholderPage,
  }) : super(
            transitionsBuilder: _fadeTransitionsBuilder,
            settings: RouteSettings(name: routeName),
            maintainState: true,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationAuthenticated ||
                    state is AuthenticationImpersonating) {
                  return guardedPage;
                } else if (state is AuthenticationUnauthenticated) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {});
                }

                return placeholderPage;
              });
            });
}
