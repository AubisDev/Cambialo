part of 'post_bloc.dart';

@immutable
class PostState extends Equatable {
  final List<Post> preferencesPosts;
  final List<Post> recentsPosts;
  final String error;

  const PostState({
    this.error = "",
    this.recentsPosts = const [],
    this.preferencesPosts = const [],
  });

  PostState copyWith({
    List<Post>? recentsPosts,
    List<Post>? preferencesPosts,
    String? error,
  }) =>
      PostState(
        preferencesPosts: preferencesPosts ?? this.preferencesPosts,
        recentsPosts: recentsPosts ?? this.recentsPosts,
        error: error ?? this.error,
      );

  @override
  List<Object> get props => [preferencesPosts, recentsPosts];
}
