import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getUserPreferences();
  Future<List<Post>> getNewtPosts();
  Future<List<Post>> getRecommendedPosts();
  Future<List<Post>> getPostsByCategory();
  Future<Post> getPostById();
}
