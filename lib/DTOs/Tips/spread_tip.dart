class SpreadTipDTO {
  final int id;

  SpreadTipDTO({required this.id});

  Map<String, dynamic> toJson() => {"tip_id": id};
}
