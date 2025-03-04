import 'package:truequealo/domain/entities/entities.dart';

abstract class PostsDatasource {
  Future<List<Post>> getUserPreferences(List<int> categoriesIds,
      {int page = 1});
  Future<List<Post>> getRecentPosts({int page = 1});
  Future<List<Post>> getRecommendedPosts({int page = 1});
  Future<List<Post>> getPostsByCategory(int cateogoryId, {int page = 1});
  Future<Post> getPostById(int id);
}
