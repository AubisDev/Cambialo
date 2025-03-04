import 'package:truequealo/domain/entities/entities.dart';
import 'package:truequealo/infrastructure/models/post_supabase.dart';

import '../models/user_supabase.dart';

class PostMapper {
  static Post postToPostEntity(
      PostSupabase postSupabase, UserSupabase userSupabase) {
    final user = User(
      id: userSupabase.id,
      createdAt: userSupabase.createdAt,
      email: userSupabase.email,
      firstName: userSupabase.firstName,
      lastName: userSupabase.lastName,
      profilePicture: userSupabase.profilePicture,
      phone: userSupabase.phone,
    );
    return Post(
        id: postSupabase.id,
        authorId: postSupabase.author_id,
        createdAt: postSupabase.created_at,
        images: postSupabase.images,
        location: postSupabase.location,
        title: postSupabase.title,
        description: postSupabase.description,
        likes: postSupabase.likes,
        dislikes: postSupabase.dislikes,
        likedBy: postSupabase.liked_by,
        questionsIds: postSupabase.questions_id,
        categoriesIds: postSupabase.categories_id,
        authorData: user);
  }
}
