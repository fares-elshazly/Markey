List<Service> servicesFromJson(List json) =>
    List<Service>.from(json.map((x) => Service.fromJson(x)));

class Service {
  final int id;
  final String name;
  final Service? parent;
  final List<Service>? subservices;

  Service({
    required this.id,
    required this.name,
    required this.parent,
    required this.subservices,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["title"],
        parent: _parseParent(json["parent"]?["data"]),
        subservices: _parseSubservices(json["childs"]?["data"]),
      );

  static Service? _parseParent(Map<String, dynamic>? parent) {
    if (parent == null) return null;
    return Service.fromJson(parent);
  }

  static List<Service>? _parseSubservices(List? data) {
    if (data == null || data.isEmpty) return null;
    return servicesFromJson(data);
  }
}
