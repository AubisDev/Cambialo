import 'package:truequealo/domain/datasources/posts_datasource.dart';
import 'package:truequealo/domain/entities/post.dart';

class PostSupabaseDatasource extends PostsDatasource {
  @override
  Future<List<Post>> getNewtPosts() {
    // TODO: implement getNewtPosts
    throw UnimplementedError();
  }

  @override
  Future<Post> getPostById(String id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPostsByCategory(String cateogoryId) {
    // TODO: implement getPostsByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getRecommendedPosts() {
    // TODO: implement getRecommendedPosts
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getUserPreferences() {
    // TODO: implement getUserPreferences
    throw UnimplementedError();
  }
}
