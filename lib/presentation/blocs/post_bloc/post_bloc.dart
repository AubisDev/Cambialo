import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/entities/user.dart';
import '../../../infrastructure/repositories/post_repository_impl.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepositoryImpl _postRepository;

  PostBloc(this._postRepository) : super(const PostState()) {
    on<FetchedHomeDataEvent>(_onFetchedPosts);
    on<LoadMoreRecentPosts>(_onLoadNextPageRecentPosts);
    on<LoadMorePreferencesPosts>(_onLoadNextPagePreferencesPosts);
  }

  void _onFetchedPosts(
      FetchedHomeDataEvent event, Emitter<PostState> emit) async {
    try {
      final recentPosts = await _postRepository.datasource.getRecentPosts();
      final preferencesPosts =
          await _postRepository.datasource.getUserPreferences([4]);
      emit(state.copyWith(
          recentsPosts: recentPosts, preferencesPosts: preferencesPosts));
    } catch (e, trackTrace) {
      print(e);
      print(trackTrace);
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadNextPageRecentPosts(
      LoadMoreRecentPosts event, Emitter<PostState> emit) async {
    if (state.finalRecentPostsPageReached) return;

    try {
      final nextPage = state.currentPageRecentPosts + 1;
      final recentPosts =
          await _postRepository.datasource.getRecentPosts(page: nextPage);
      if (recentPosts.isEmpty) {
        emit(state.copyWith(finalRecentPostsPageReached: true));
      }
      emit(state.copyWith(recentsPosts: recentPosts));
    } catch (e, trackTrace) {
      print(e);
      print(trackTrace);
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadNextPagePreferencesPosts(
      LoadMorePreferencesPosts event, Emitter<PostState> emit) async {
    if (state.finalPreferencesPostsPageReached) return;

    try {
      final nextPage = state.currentPagePreferencesPosts + 1;
      final preferencesPosts = await _postRepository.datasource
          .getUserPreferences([4, 2], page: nextPage);
      if (preferencesPosts.isEmpty) {
        emit(state.copyWith(finalPreferencesPostsPageReached: true));
      }
      emit(state.copyWith(recentsPosts: preferencesPosts));
    } catch (e, trackTrace) {
      print(e);
      print(trackTrace);
      emit(state.copyWith(error: e.toString()));
    }
  }
}
