import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/post_model.dart';
import 'package:easy_doctor/src/repositories/posts_repository.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.postsRepository})
      : super(const PostsNotLoaded(message: '')) {
    on<PostsEvent>((event, emit) {
      // TODO: implement event handler
      if (event is LoadPosts) {
        _onLoadPosts(event, emit);
      }
    });
  }

  final PostsRepository postsRepository;
  final Logger logger = CustomLogger().getLogger();

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostsState> emit) async {
    emit(const PostsLoading());
    try {
      List<PostModel> posts = await postsRepository.listPosts();
      //await Future.delayed(Duration(seconds: 5));
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      logger.e(e);
      emit(PostsNotLoaded(message: e.toString()));
    }
  }
}
