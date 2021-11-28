import 'package:easy_doctor/src/mock/comments_mock.dart';
import 'package:easy_doctor/src/models/comment.dart';
import 'package:easy_doctor/src/models/post.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:logger/logger.dart';

class CommentsRepository {
  final Logger _logger = CustomLogger().getLogger();

  Future<List<CommentModel>> listComments(PostID postID) async {
    try {
      return commentsMock;
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }
}
