part of 'post_bloc.dart';

@immutable
abstract class PostEvent {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchedHomeDataEvent extends PostEvent {
  FetchedHomeDataEvent();
}

class FetchedHomeDataEventError extends PostEvent {
  final String error;

  FetchedHomeDataEventError(this.error);
}
