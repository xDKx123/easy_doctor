import 'package:easy_doctor/src/mock/posts_mock.dart';
import 'package:easy_doctor/src/models/post.dart';

class PostsRepository {
  Future<List<PostModel>> listPosts() async {
    try {
      return postsMock;
      //return <PostModel>[];
    } catch (e) {
      return <PostModel>[];
    }
  }
}
