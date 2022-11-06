class RateTipDTO {
  final int id;
  final int rate;

  RateTipDTO({
    required this.id,
    required this.rate,
  });

  Map<String, dynamic> toJson() => {
        "tip_id": id,
        "rate": rate,
      };
}
