class PostSupabase {
  final int id;
  final int author_id;
  final DateTime created_at;
  final List<String> images;
  final String location;
  final String description;
  final String title;
  final int likes;
  final int dislikes;
  final List<int> liked_by;
  final List<int> questions_id;
  final List<int> categories_id;

  PostSupabase({
    required this.id,
    required this.author_id,
    required this.created_at,
    required this.images,
    required this.location,
    required this.description,
    required this.title,
    required this.likes,
    required this.dislikes,
    required this.liked_by,
    required this.questions_id,
    required this.categories_id,
  });

  factory PostSupabase.fromJson(Map<String, dynamic> json) => PostSupabase(
        id: json['id'] as int,
        author_id: json['author_id'] as int,
        created_at: DateTime.parse(json['created_at'] as String),
        images:
            (json['images'] as List<dynamic>).map((e) => e.toString()).toList(),
        location: json['location'] as String,
        description: json['description'] as String,
        title: json['title'] as String,
        likes: json['likes'] as int,
        dislikes: json['dislikes'] as int,
        liked_by: json['liked_by'] != null
            ? (json['liked_by'] as List<dynamic>).map((e) => e as int).toList()
            : [],
        questions_id: json['questions_ids'] != null
            ? (json['questions_ids'] as List<dynamic>)
                .map((e) => e as int)
                .toList()
            : [],
        categories_id: json['categories_ids'] != null
            ? (json['categories_ids'] as List<dynamic>)
                .map((e) => e as int)
                .toList()
            : [],
      );
}

class Question {
  final String id;
  final String description;
  final bool has_answer;
  final String author_id;
  final DateTime created_at;
  final String postId;
  final String reply;
  final int likes;

  Question({
    required this.id,
    required this.description,
    required this.has_answer,
    required this.author_id,
    required this.created_at,
    required this.postId,
    required this.reply,
    required this.likes,
  });
}
