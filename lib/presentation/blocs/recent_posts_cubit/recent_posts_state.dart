part of 'recent_posts_cubit.dart';

@immutable
class RecentPostsState extends Equatable {
  final List<Post> posts;
  final String error;
  final int currentPage;
  final bool finalPageReached;

  const RecentPostsState({
    this.posts = const [],
    this.error = "",
    this.currentPage = 0,
    this.finalPageReached = false,
  });

  RecentPostsState copyWith({
    List<Post>? posts,
    String? error,
    int? currentPage,
    bool? finalPageReached,
  }) =>
      RecentPostsState(
        posts: posts ?? this.posts,
        error: error ?? this.error,
        currentPage: currentPage ?? this.currentPage,
        finalPageReached: finalPageReached ?? this.finalPageReached,
      );

  @override
  List<Object> get props => [
        posts,
        error,
        currentPage,
        finalPageReached,
      ];
}
