part of 'post_cubit.dart';

@immutable
class PostState extends Equatable {
  final Post? post;
  final List<Post> seenPosts;

  const PostState({this.post, this.seenPosts = const []});

  PostState copyWith({
    Post? post,
  }) =>
      PostState(
          post: post ?? this.post,
          seenPosts: post != null ? [...seenPosts, post] : seenPosts);

  @override
  List<Object?> get props => [post];
}
