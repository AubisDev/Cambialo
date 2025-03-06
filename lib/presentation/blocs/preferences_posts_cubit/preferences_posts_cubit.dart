import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/post.dart';
import '../../../infrastructure/repositories/post_repository_impl.dart';

part 'preferences_posts_state.dart';

class PreferencesPostsCubit extends Cubit<PreferencesPostsState> {
  final PostRepositoryImpl _postRepository;

  PreferencesPostsCubit(this._postRepository)
      : super(const PreferencesPostsState());

  Future<void> onLoadNextPage() async {
    if (state.finalPageReached) return;

    try {
      final nextPage = state.currentPage + 1;
      final posts =
          await _postRepository.datasource.getRecentPosts(page: nextPage);
      if (posts.isEmpty) {
        emit(state.copyWith(finalPageReached: true));
      }
      emit(state.copyWith(posts: [...state.posts, ...posts]));
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
