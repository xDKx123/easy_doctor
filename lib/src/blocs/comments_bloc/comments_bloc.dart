import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/repositories/comments_repository.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({required this.commentsRepository})
      : super(const CommentsNotLoaded()) {
    on<CommentsEvent>((event, emit) async {
      if (event is LoadComments) {
        await _onLoadComments(event, emit);
      }
    });
  }

  final CommentsRepository commentsRepository;
  final Logger _logger = CustomLogger().getLogger();

  Future<void> _onLoadComments(
      LoadComments event, Emitter<CommentsState> emit) async {
    emit(const CommentsLoading());

    try {
      List<CommentModel> comments =
          await commentsRepository.listComments(event.postID);

      emit(CommentsLoaded(comments: comments));
    } catch (e) {
      _logger.e(e);
      emit(const CommentsNotLoaded());
    }
  }
}
