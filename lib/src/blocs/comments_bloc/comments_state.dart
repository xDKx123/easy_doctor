part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
}

class CommentsLoading extends CommentsState {
  const CommentsLoading();

  @override
  List<Object?> get props => [];
}

class CommentsLoaded extends CommentsState {
  const CommentsLoaded({required this.comments});

  final List<CommentModel> comments;

  @override
  List<Object?> get props => <Object>[comments];
}

class CommentsNotLoaded extends CommentsState {
  const CommentsNotLoaded();

  @override
  List<Object?> get props => [];
}

class CommentsAdditional extends CommentsState {
  const CommentsAdditional({required this.additionalComments});

  final List<CommentModel> additionalComments;
  @override
  List<Object?> get props => <Object?>[];
}
