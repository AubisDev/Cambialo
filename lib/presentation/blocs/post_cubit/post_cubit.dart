import 'package:bloc/bloc.dart';
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
        state.seenPosts.firstWhere((post) => post.id == id, orElse: null);
    if (alreadySeenPost != null) {
      state.copyWith(post: alreadySeenPost);
      return;
    }
    print("FETCHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
    final post = await _postRepository.datasource.getPostById(id);
    state.copyWith(post: post);
  }

  void _clearPost() {
    state.copyWith(post: null);
  }
}
