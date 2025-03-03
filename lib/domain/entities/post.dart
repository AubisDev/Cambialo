class Post {
  final int id;
  final int authorId;
  final DateTime createdAt;
  final List<String> images;
  final String location;
  final String description;
  final String title;
  final int likes;
  final int dislikes;
  final List<int> likedBy;
  final List<int> questionsIds;
  final List<int> categoriesIds;

  Post(
      {required this.id,
      required this.authorId,
      required this.createdAt,
      required this.images,
      required this.location,
      required this.description,
      required this.title,
      required this.likes,
      required this.dislikes,
      required this.likedBy,
      required this.questionsIds,
      required this.categoriesIds});
}

class Question {
  final String id;
  final String description;
  final bool hasAnswer;
  final String authorId;
  final DateTime createdAt;
  final String postId;
  final String reply;
  final int likes;

  Question(
      {required this.id,
      required this.description,
      required this.hasAnswer,
      required this.authorId,
      required this.createdAt,
      required this.postId,
      required this.reply,
      required this.likes});
}
