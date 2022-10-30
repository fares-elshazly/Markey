class AddCommunityDTO {
  final String title;
  final String subtitle;
  final String description;
  final String offer;

  AddCommunityDTO({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.offer,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "sub_title": subtitle,
        "description": description,
        "offer": offer,
      };
}
