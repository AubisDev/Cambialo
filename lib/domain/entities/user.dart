class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final DateTime? dateOfBirth;
  final String? phone;
  final Address? address;
  final DateTime createdAt;
  final String? profilePicture;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.dateOfBirth,
    this.phone,
    this.address,
    required this.createdAt,
    this.profilePicture,
  });
}

class Address {
  final String city;
  final String state;

  Address({
    required this.city,
    required this.state,
  });
}
