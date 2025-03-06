import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/post.dart';
import '../../../infrastructure/repositories/post_repository_impl.dart';

part 'recent_posts_state.dart';

class RecentPostsCubit extends Cubit<RecentPostsState> {
  final PostRepositoryImpl _postRepository;
  RecentPostsCubit(this._postRepository) : super(const RecentPostsState());

  Future<void> onLoadNextPage() async {
    if (state.finalPageReached) return;

    try {
      final nextPage = state.currentPage + 1;
      final newPosts =
          await _postRepository.datasource.getRecentPosts(page: nextPage);
      if (newPosts.isEmpty) {
        emit(state.copyWith(finalPageReached: true));
      }
      emit(state.copyWith(posts: [...state.posts, ...newPosts]));
    } catch (e, trackTrace) {
      print(e);
      print(trackTrace);
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> loadInitialData() async {
    try {
      final posts = await _postRepository.datasource.getRecentPosts();
      emit(state.copyWith(posts: posts));
    } catch (e, trackTrace) {
      print(e);
      print(trackTrace);
      emit(state.copyWith(error: e.toString()));
    }
  }
}
