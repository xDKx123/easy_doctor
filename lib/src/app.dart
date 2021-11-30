import 'package:easy_doctor/generated/l10n.dart';
import 'package:easy_doctor/src/app/routes/routes.dart';
import 'package:easy_doctor/src/blocs/all_chat_bloc/all_chat_bloc.dart';
import 'package:easy_doctor/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:easy_doctor/src/blocs/comments_bloc/comments_bloc.dart';
import 'package:easy_doctor/src/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:easy_doctor/src/blocs/language_bloc/language_bloc.dart';
import 'package:easy_doctor/src/blocs/posts_bloc/posts_bloc.dart';
import 'package:easy_doctor/src/blocs/profile_bloc/profile_bloc.dart';
import 'package:easy_doctor/src/blocs/theme_bloc/theme_bloc.dart';
import 'package:easy_doctor/src/repositories/chat_repository.dart';
import 'package:easy_doctor/src/repositories/comments_repository.dart';
import 'package:easy_doctor/src/repositories/posts_repository.dart';
import 'package:easy_doctor/src/repositories/profile_repository.dart';
import 'package:easy_doctor/src/ui/views/posts/posts_view.dart';
import 'package:easy_doctor/src/utils/localStorage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/chat_messages/chat_messages_bloc.dart';
import 'blocs/smart_list_bloc/smart_list_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.postsRepository,
    required this.commentsRepository,
    required this.profileRepository,
    required this.localStorageRepository,
    required this.chatRepository,
  }) : super(key: key);

  final PostsRepository postsRepository;
  final CommentsRepository commentsRepository;
  final ProfileRepository profileRepository;
  final LocalStorageRepository localStorageRepository;
  final ChatRepository chatRepository;

  //final ValueNotifier<GraphQLClient> client;
  //HttpLink httpLink = HttpLink("http://10.0.2.2:4000/");

/*  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      cache: GraphQLCache(), link: HttpLink("http://10.0.2.2:4000/")));*/

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(const LoadTheme()),
        ),
        BlocProvider<SmartListBloc>(create: (_) => SmartListBloc()),
        BlocProvider<PostsBloc>(
          create: (context) => PostsBloc(postsRepository: postsRepository),
        ),
        BlocProvider<CommentsBloc>(
          create: (context) =>
              CommentsBloc(commentsRepository: commentsRepository),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (context) =>
              ConnectivityBloc()..add(const ConnectivityEmit()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(profileRepository: profileRepository)
            ..add(LoadProfile()),
        ),
        BlocProvider<LanguageBloc>(
          create: (context) =>
              LanguageBloc(localStorageRepository: localStorageRepository)
                ..add(const LoadLanguage()),
        ),
        BlocProvider<AllChatBloc>(
          create: (context) => AllChatBloc(chatRepository: chatRepository),
        ),
        BlocProvider<ChatMessagesBloc>(
          create: (context) => ChatMessagesBloc(chatRepository: chatRepository),
        ),
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
  //final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  //NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (BuildContext context, LanguageState languageState) {
            return MaterialApp(
              title: 'Easy doctor',
              onGenerateRoute: generateRoute,
              //initialRoute: introRoute,
              home: const HomePage(),
              //navigatorKey: _navigatorKey,
              theme: themeState.themeData,
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              //home: LoginView(),
              supportedLocales: S.delegate.supportedLocales,
            );
          },
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityBloc, ConnectivityState>(
      listener: (BuildContext context, ConnectivityState connectivityState) {
        if (connectivityState is ConnectivityConnected) {
          print('is connected');
        } else if (connectivityState is ConnectivityDisconnected) {
          print('is not connected');
        }
      },
      builder: (BuildContext context, ConnectivityState state) {
        return BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            //_navigator.pushNamed(postsRoute);
            //Navigator.of(context).pushReplacementNamed(postsRoute);
          },
          builder: (BuildContext context, AuthenticationState state) {
            return const PostsView();
          },
        );
      },
    );
  }
}
