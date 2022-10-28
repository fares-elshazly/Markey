class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "token": token,
      };
}
