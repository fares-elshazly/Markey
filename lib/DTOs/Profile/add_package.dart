class AddPackageDTO {
  final String title;
  final String description;
  final double cost;
  final int duration;
  final int userId;

  AddPackageDTO({
    required this.title,
    required this.description,
    required this.cost,
    required this.duration,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'cost': cost,
        'durartion': duration,
        'user_id': userId,
      };
}
