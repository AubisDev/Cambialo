import 'package:truequealo/domain/entities/entities.dart';

abstract class PostsDatasource {
  Future<List<Post>> getUserPreferences();
  Future<List<Post>> getNewtPosts();
  Future<List<Post>> getRecommendedPosts();
  Future<List<Post>> getPostsByCategory();
  Future<Post> getPostById();
}
