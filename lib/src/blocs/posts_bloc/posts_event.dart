part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class LoadPosts extends PostsEvent {
  const LoadPosts();

  @override
  List<Object?> get props => <Object?>[];
}

class AddPost extends PostsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
