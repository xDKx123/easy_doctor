import 'package:easy_doctor/src/app.dart';
import 'package:easy_doctor/src/graphQl/graphql.dart';
import 'package:easy_doctor/src/repositories/comments_repository.dart';
import 'package:easy_doctor/src/repositories/posts_repository.dart';
import 'package:easy_doctor/src/repositories/profile_repository.dart';
import 'package:easy_doctor/src/utils/localStorage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  final ValueNotifier<GraphQLClient> client =
      GraphQl.getTestingEnvironmentClient();

  runApp(App(
    postsRepository: PostsRepository(),
    commentsRepository: CommentsRepository(),
    profileRepository: ProfileRepository(),
    localStorageRepository: LocalStorageRepository(),
  ));
}
