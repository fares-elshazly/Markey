List<Community> communitiesFromJson(List json) =>
    List<Community>.from(json.map((x) => Community.fromJson(x)));

class Community {
  final int id;
  final String title;
  final String subtitle;
  final double rate;
  final String description;
  final String offer;

  Community({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.rate,
    required this.description,
    required this.offer,
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        title: json["title"],
        subtitle: json["sub_title"],
        rate: json["rate"].toDouble(),
        description: json["description"],
        offer: json["offer"],
      );
}
