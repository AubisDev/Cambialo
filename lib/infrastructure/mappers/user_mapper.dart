import 'package:truequealo/domain/entities/entities.dart';

import '../models/user_supabase.dart';

class UserMapper {
  static User userToEntityUser(UserSupabase userSupabase) => User(
        id: userSupabase.id,
        firstName: userSupabase.firstName,
        lastName: userSupabase.lastName,
        email: userSupabase.email,
        createdAt: userSupabase.createdAt,
        profilePicture: userSupabase.profilePicture,
        phone: userSupabase.phone,
      );
}
