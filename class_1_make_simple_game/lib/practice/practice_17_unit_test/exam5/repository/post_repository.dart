import '../model/post.dart';

abstract interface class PostRepository {
  Future<List<Map<String, dynamic>>> getPosts();
  Future<void> addPost(Post post);
  Future<void> deletePost(Post post);
  Future<void> updatePost(Post post);
}
