List<PreviousWork> previousWorksFromJson(List json) =>
    List<PreviousWork>.from(json.map((x) => PreviousWork.fromJson(x)));

class PreviousWork {
  final int id;
  final String image;

  PreviousWork({required this.id, required this.image});

  factory PreviousWork.fromJson(Map<String, dynamic> json) => PreviousWork(
        id: json["id"],
        image: json["image"],
      );
}
