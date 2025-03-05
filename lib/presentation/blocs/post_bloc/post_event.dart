part of 'post_bloc.dart';

@immutable
abstract class PostEvent {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchedHomeDataEvent extends PostEvent {
  const FetchedHomeDataEvent();
}

class FetchedHomeDataEventError extends PostEvent {
  final String error;

  const FetchedHomeDataEventError(this.error);
}

class FetchUserEvent extends PostEvent {
  final User user;
  const FetchUserEvent(this.user);
}

class LoadMoreRecentPosts extends PostEvent {
  const LoadMoreRecentPosts();
}

class LoadMorePreferencesPosts extends PostEvent {
  const LoadMorePreferencesPosts();
}
