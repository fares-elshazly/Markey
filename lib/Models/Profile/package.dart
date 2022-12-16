List<Package> packagesFromJson(List json) =>
    List<Package>.from(json.map((x) => Package.fromJson(x)));

class Package {
  final int id;
  final String title;
  final String description;
  final double cost;
  final int duration;

  Package({
    required this.id,
    required this.title,
    required this.description,
    required this.cost,
    required this.duration,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        cost: json["cost"]?.toDouble(),
        duration: json["duration"],
      );
}
