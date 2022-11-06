import '/Models/Tags/tag.dart';

List<Tip> tipsFromJson(List json) =>
    List<Tip>.from(json.map((x) => Tip.fromJson(x)));

class Tip {
  final int id;
  final String title;
  final String content;
  final double rate;
  final int spreadCount;
  final List<Tag> tags;

  Tip({
    required this.id,
    required this.title,
    required this.content,
    required this.rate,
    required this.spreadCount,
    required this.tags,
  });

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        rate: json["rate"].toDouble(),
        spreadCount: json["spread_count"],
        tags: tagsFromJson(json["tags"]["data"]),
      );
}
