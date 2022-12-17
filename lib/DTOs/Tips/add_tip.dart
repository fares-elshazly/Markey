class AddTipDTO {
  final String title;
  final String content;
  final List<int> tagsIds;
  final int userId;

  AddTipDTO({
    required this.title,
    required this.content,
    required this.tagsIds,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "tags": tagsIds,
        "user_id": userId,
      };
}
