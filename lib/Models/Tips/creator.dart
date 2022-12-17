class Creator {
  final int id;
  final String name;
  final String? avatar;
  final String username;

  Creator({
    required this.id,
    required this.name,
    required this.avatar,
    required this.username,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        username: json["username"],
      );
}
