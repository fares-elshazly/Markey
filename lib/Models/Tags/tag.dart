List<Tag> tagsFromJson(List json) =>
    List<Tag>.from(json.map((x) => Tag.fromJson(x)));

class Tag {
  final int id;
  final String name;

  Tag({required this.id, required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["title"],
      );
}
