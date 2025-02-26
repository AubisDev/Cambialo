import 'package:truequealo/domain/entities/user.dart';

class Post {
  final String id;
  final User user;
  final DateTime createdAt;
  final String portraitImage;
  final List<String> images;
  final String location;
  final String description;
  final int likes;
  final List<User> likedBy;
  final int commentsAmount;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.portraitImage,
    required this.images,
    required this.location,
    required this.description,
    required this.likes,
    required this.likedBy,
    required this.commentsAmount,
    required this.comments,
  });
}

class Comment {
  final String id;
  final String content;
  final String authorId;
  final DateTime createdAt;
  final String postId;
  final List<Comment>? replies;
  final int likes;

  Comment({
    required this.id,
    required this.content,
    required this.authorId,
    required this.createdAt,
    required this.postId,
    this.replies,
    this.likes = 0,
  });
}
