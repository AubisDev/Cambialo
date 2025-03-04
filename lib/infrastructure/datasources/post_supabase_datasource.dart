import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truequealo/domain/datasources/posts_datasource.dart';
import 'package:truequealo/domain/entities/post.dart';

import '../mappers/post_mapper.dart';
import '../models/post_supabase.dart';

final supabase = Supabase.instance.client;
final pageSize = 5;

class PostSupabaseDatasource extends PostsDatasource {
  Post _responseToPostEntity(Map<String, dynamic> apiResponse) {
    final postSupabase = PostSupabase.fromJson(apiResponse);
    return PostMapper.postToPostEntity(postSupabase);
  }

  @override
  Future<List<Post>> getRecentPosts({int page = 1}) async {
    final offset = (page - 1) * pageSize;
    final response = await supabase
        .from('posts')
        .select()
        .order('created_at', ascending: false)
        .range(offset, offset + pageSize - 1);
    if (response == null || response.isEmpty) {
      return [];
    }
    return response.map((post) => _responseToPostEntity(post)).toList();
  }

  @override
  Future<Post> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPostsByCategory(int categoryId, {int page = 1}) async {
    final offset = (page - 1) * pageSize;
    final List<Map<String, dynamic>> response = await supabase
        .from('posts')
        .select()
        .contains('categories_id', [categoryId]).range(
            offset, offset + pageSize - 1);
    if (response == null || response.isEmpty) {
      return [];
    }
    return response.map((post) => _responseToPostEntity(post)).toList();
  }

  @override
  Future<List<Post>> getRecommendedPosts({int page = 1}) async {
    final posts = await getPostsByCategory(4, page: page);
    return posts;
  }

  @override
  Future<List<Post>> getUserPreferences(List<int> categoriesIds,
      {int page = 1}) async {
    List<Future<List<Post>>> futures = categoriesIds.map((category) async {
      return await getPostsByCategory(category, page: page);
    }).toList();
    List<List<Post>> postsList = await Future.wait(futures);
    List<Post> posts = postsList.fold([], (resultingPostsList, posts) {
      return [...resultingPostsList, ...posts];
    });
    print("preference posts: $posts");
    return posts;
  }
}
