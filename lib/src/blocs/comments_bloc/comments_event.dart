part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
}

class LoadComments extends CommentsEvent {
  const LoadComments({required this.postID});

  final PostID postID;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddComment extends CommentsEvent {
  const AddComment({required this.postID});

  final PostID postID;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
