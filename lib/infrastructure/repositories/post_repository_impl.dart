import 'package:truequealo/domain/datasources/posts_datasource.dart';
import 'package:truequealo/domain/entities/post.dart';
import 'package:truequealo/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostsDatasource datasource;

  PostRepositoryImpl(this.datasource);

  @override
  Future<List<Post>> getNewtPosts() {
    return datasource.getNewtPosts();
  }

  @override
  Future<Post> getPostById(String id) {
    return datasource.getPostById(id);
  }

  @override
  Future<List<Post>> getPostsByCategory(String categoryId) {
    return datasource.getPostsByCategory(categoryId);
  }

  @override
  Future<List<Post>> getRecommendedPosts() {
    return datasource.getRecommendedPosts();
  }

  @override
  Future<List<Post>> getUserPreferences() {
    return datasource.getUserPreferences();
  }
}
