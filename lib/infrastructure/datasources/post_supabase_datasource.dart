import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truequealo/domain/datasources/posts_datasource.dart';
import 'package:truequealo/domain/entities/post.dart';

final supabase = Supabase.instance.client;

class PostSupabaseDatasource extends PostsDatasource {
  @override
  Future<List<Post>> getNewtPosts({int page = 1}) {
    // TODO: implement getNewtPosts
    throw UnimplementedError();
  }

  @override
  Future<Post> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPostsByCategory(int categoryId, {int page = 1}) {
    // TODO: implement getPostsByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getRecommendedPosts({int page = 1}) {
    // TODO: implement getRecommendedPosts
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getUserPreferences(List<int> categoriesIds,
      {int page = 1}) {
    // TODO: implement getUserPreferences
    throw UnimplementedError();
  }
}
