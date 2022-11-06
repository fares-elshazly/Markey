class AddTipDTO {
  final String title;
  final String content;
  final List<int> tagsIds;

  AddTipDTO({
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
