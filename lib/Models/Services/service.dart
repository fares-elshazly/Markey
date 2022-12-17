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
        parent: json["parent"],
        subservices: servicesFromJson(json["childs"]["data"]),
      );
}
