class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final DateTime createdAt;
  final String? profilePicture;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.createdAt,
    this.profilePicture,
  });
}
