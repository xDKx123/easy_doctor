import 'package:easy_doctor/generated/l10n.dart';
import 'package:easy_doctor/src/app/routes/routes.dart';
import 'package:easy_doctor/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:easy_doctor/src/blocs/posts_bloc/posts_bloc.dart';
import 'package:easy_doctor/src/blocs/theme_bloc/theme_bloc.dart';
import 'package:easy_doctor/src/repositories/posts_repository.dart';
import 'package:easy_doctor/src/ui/views/posts/posts_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/smart_list_bloc/smart_list_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.postsRepository,
  }) : super(key: key);

  final PostsRepository postsRepository;

  //final ValueNotifier<GraphQLClient> client;
  //HttpLink httpLink = HttpLink("http://10.0.2.2:4000/");

/*  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      cache: GraphQLCache(), link: HttpLink("http://10.0.2.2:4000/")));*/

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..add(LoadTheme()),
        ),
        BlocProvider<SmartListBloc>(create: (_) => SmartListBloc()),
        BlocProvider<PostsBloc>(
          create: (_) => PostsBloc(postsRepository: postsRepository),
        )
      ],
      child: const AppView(),
    );
/*    return GraphQLProvider(
      client: client,
      child: AppView(),
    );*/
/*    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc()..add(LoadTheme()),
          )
        ],
        child: AppView(),
      ),
    );*/
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy doctor',
      onGenerateRoute: generateRoute,
      //initialRoute: introRoute,
      home: HomePage(),
      navigatorKey: _navigatorKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //home: LoginView(),
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        //_navigator.pushNamed(postsRoute);
        //Navigator.of(context).pushReplacementNamed(postsRoute);
      },
      builder: (context, state) {
        return PostsView();
      },
    );
  }
}
