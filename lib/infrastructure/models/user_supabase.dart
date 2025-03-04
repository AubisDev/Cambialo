class UserSupabase {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final DateTime createdAt;
  final String? profilePicture;

  UserSupabase({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.createdAt,
    this.profilePicture,
  });

  factory UserSupabase.fromJson(Map<String, dynamic> json) => UserSupabase(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at'] as String),
      profilePicture: json['profile_picture'] ?? "",
      phone: json['phone'] ?? "");
}
