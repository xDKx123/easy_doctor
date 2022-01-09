import 'package:easy_doctor/src/app.dart';
import 'package:easy_doctor/src/repositories/chat_repository.dart';
import 'package:easy_doctor/src/repositories/comments_repository.dart';
import 'package:easy_doctor/src/repositories/personal_list_item_repository.dart';
import 'package:easy_doctor/src/repositories/personal_list_repository.dart';
import 'package:easy_doctor/src/repositories/posts_repository.dart';
import 'package:easy_doctor/src/repositories/profile_repository.dart';
import 'package:easy_doctor/src/utils/localStorage/local_storage.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  /* final ValueNotifier<GraphQLClient> client =
      GraphQl.getTestingEnvironmentClient();*/

  runApp(
    App(
      postsRepository: PostsRepository(),
      commentsRepository: CommentsRepository(),
      profileRepository: ProfileRepository(),
      localStorageRepository: LocalStorageRepository(),
      chatRepository: const ChatRepository(),
      personalListItemRepository: PersonalListItemRepository(),
      personalListRepository: PersonalListRepository(),
    ),
  );
}
