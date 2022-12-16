List<Certificate> certificatesFromJson(List json) =>
    List<Certificate>.from(json.map((x) => Certificate.fromJson(x)));

class Certificate {
  final int id;
  final String image;

  Certificate({required this.id, required this.image});

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: json["id"],
        image: json["image"],
      );
}
