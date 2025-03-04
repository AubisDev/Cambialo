import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getUserPreferences(List<int> categoriesIds,
      {int page = 1});
  Future<List<Post>> getNewtPosts({int page = 1});
  Future<List<Post>> getRecommendedPosts({int page = 1});
  Future<List<Post>> getPostsByCategory(int categoryId, {int page = 1});
  Future<Post> getPostById(int id);
}
