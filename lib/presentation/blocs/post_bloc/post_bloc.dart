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
  }

  void _onFetchedPosts(
      FetchedHomeDataEvent event, Emitter<PostState> emit) async {
    try {
      final recentPosts = await _postRepository.datasource.getRecentPosts();
      final preferencesPosts =
          await _postRepository.datasource.getUserPreferences([4]);
      print("recent from bloc $recentPosts");
      print("preferences from bloc $preferencesPosts");
      emit(state.copyWith(
          recentsPosts: recentPosts, preferencesPosts: preferencesPosts));
    } catch (e, trackTrace) {
      print(e);
      print(trackTrace);
      emit(state.copyWith(error: e.toString()));
    }
  }
}
