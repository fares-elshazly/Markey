class ReportTipDTO {
  final int id;

  ReportTipDTO({required this.id});

  Map<String, dynamic> toJson() => {"tip_id": id};
}
