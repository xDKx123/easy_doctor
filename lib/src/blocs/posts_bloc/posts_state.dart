part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostsLoading extends PostsState {
  const PostsLoading();
  @override
  List<Object> get props => [];
}

class PostsLoaded extends PostsState {
  const PostsLoaded({required this.posts});

  final List<PostModel> posts;

  @override
  List<Object> get props => [posts];
}

class PostsNotLoaded extends PostsState {
  const PostsNotLoaded({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
