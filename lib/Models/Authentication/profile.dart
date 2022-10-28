class Profile {
  final int id;
  final String name;
  final String email;
  final String avatar;
  final String gender;
  final String location;
  final String description;
  final String username;
  final String qrCode;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.location,
    required this.description,
    required this.username,
    required this.qrCode,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        gender: json["gender"],
        location: json["location"],
        description: json["description"],
        username: json["username"],
        qrCode: json["qr_code"],
      );
}
