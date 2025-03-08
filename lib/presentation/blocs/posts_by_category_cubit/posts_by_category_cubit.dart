import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:truequealo/infrastructure/repositories/post_repository_impl.dart';

import '../../../domain/entities/post.dart';

part 'posts_by_category_state.dart';

class PostsByCategoryCubit extends Cubit<PostsByCategoryState> {
  final PostRepositoryImpl _postRepository;

  PostsByCategoryCubit(this._postRepository)
      : super(const PostsByCategoryState());

  Future<void> getPostsByCategoryId(int id) async {
    state.copyWith(isLoading: true);
    try {
      final List<Post> postsById =
          await _postRepository.datasource.getPostsByCategory(id);
      state.copyWith(posts: postsById);
    } catch (e) {
      print(e);
      state.copyWith(error: e.toString());
    } finally {
      state.copyWith(isLoading: false);
    }
  }
}
