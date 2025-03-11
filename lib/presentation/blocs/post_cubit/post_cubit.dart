import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/post.dart';
import '../../../infrastructure/repositories/post_repository_impl.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepositoryImpl _postRepository;

  PostCubit(this._postRepository) : super(const PostState());

  Future<void> getPostData(int id) async {
    final Post? alreadySeenPost =
        state.seenPosts.firstWhereOrNull((post) => post.id == id);

    if (alreadySeenPost != null) {
      emit(state.copyWith(post: alreadySeenPost));
      return;
    }

    try {
      final post = await _postRepository.datasource.getPostById(id);
      emit(state.copyWith(post: post));
    } catch (e) {
      print('PostCubit: Error loading post: $e');
      emit(state.copyWith(post: null)); // O un estado de error
    }
  }

  void _clearPost() {
    state.copyWith(post: null);
  }

  void handleLike(int userId) {
    final isLikedByUser = state.post!.likedBy.contains(userId);
    final updatedState = state.post;
    if (isLikedByUser) {
      updatedState!.likes -= 1;
      updatedState!.likedBy.remove(userId);
      emit(state.copyWith(post: updatedState));
      return;
    }
    updatedState!.likes += 1;
    updatedState.likedBy.add(userId);
    emit(state.copyWith(post: updatedState));
    return;
  }
}
