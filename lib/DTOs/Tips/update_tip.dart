class UpdateTipDTO {
  final int id;
  final String title;
  final String content;
  final List<int> tagsIds;

  UpdateTipDTO({
    required this.id,
    required this.title,
    required this.content,
    required this.tagsIds,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "tags": tagsIds,
      };
}
