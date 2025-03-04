import 'package:truequealo/domain/datasources/posts_datasource.dart';
import 'package:truequealo/domain/entities/post.dart';
import 'package:truequealo/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostsDatasource datasource;

  PostRepositoryImpl(this.datasource);

  @override
  Future<List<Post>> getNewtPosts({int page = 1}) {
    return datasource.getNewtPosts(page: page);
  }

  @override
  Future<Post> getPostById(int id) {
    return datasource.getPostById(id);
  }

  @override
  Future<List<Post>> getPostsByCategory(int categoryId, {int page = 1}) {
    return datasource.getPostsByCategory(categoryId);
  }

  @override
  Future<List<Post>> getRecommendedPosts({int page = 1}) {
    return datasource.getRecommendedPosts(page: page);
  }

  @override
  Future<List<Post>> getUserPreferences(List<int> categoriesIds,
      {int page = 1}) {
    return datasource.getUserPreferences(categoriesIds, page: page);
  }
}
