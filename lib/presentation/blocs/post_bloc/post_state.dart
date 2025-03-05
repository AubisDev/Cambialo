part of 'post_bloc.dart';

@immutable
class PostState extends Equatable {
  final List<Post> preferencesPosts;
  final List<Post> recentsPosts;
  final String error;
  final int currentPageRecentPosts;
  final int currentPagePreferencesPosts;
  final bool finalRecentPostsPageReached;
  final bool finalPreferencesPostsPageReached;

  const PostState({
    this.error = "",
    this.recentsPosts = const [],
    this.preferencesPosts = const [],
    this.currentPageRecentPosts = 1,
    this.currentPagePreferencesPosts = 1,
    this.finalRecentPostsPageReached = false,
    this.finalPreferencesPostsPageReached = false,
  });

  PostState copyWith({
    List<Post>? recentsPosts,
    List<Post>? preferencesPosts,
    String? error,
    int? currentPageRecentPosts,
    int? currentPagePreferencesPosts,
    bool? finalRecentPostsPageReached,
    bool? finalPreferencesPostsPageReached,
  }) =>
      PostState(
        preferencesPosts: preferencesPosts ?? this.preferencesPosts,
        recentsPosts: recentsPosts ?? this.recentsPosts,
        error: error ?? this.error,
        currentPageRecentPosts:
            currentPageRecentPosts ?? this.currentPageRecentPosts,
        currentPagePreferencesPosts:
            currentPagePreferencesPosts ?? this.currentPagePreferencesPosts,
        finalRecentPostsPageReached:
            finalRecentPostsPageReached ?? this.finalRecentPostsPageReached,
        finalPreferencesPostsPageReached: finalPreferencesPostsPageReached ??
            this.finalPreferencesPostsPageReached,
      );

  @override
  List<Object> get props => [
        preferencesPosts,
        recentsPosts,
        error,
        currentPageRecentPosts,
        currentPagePreferencesPosts,
        finalRecentPostsPageReached,
        finalPreferencesPostsPageReached,
      ];
}
