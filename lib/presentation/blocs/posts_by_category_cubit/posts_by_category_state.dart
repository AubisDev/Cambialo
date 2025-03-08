part of 'posts_by_category_cubit.dart';

@immutable
class PostsByCategoryState extends Equatable {
  final List<Post> posts;
  final bool isLoading;
  final String error;

  const PostsByCategoryState({
    this.posts = const [],
    this.isLoading = false,
    this.error = "",
  });

  PostsByCategoryState copyWith(
          {List<Post>? posts, bool? isLoading, String? error}) =>
      PostsByCategoryState(
          posts: posts ?? this.posts,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);

  @override
  List<Object?> get props => [posts, isLoading, error];
}
