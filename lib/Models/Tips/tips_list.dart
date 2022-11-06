import '/Models/Tips/tip.dart';
import '/Models/Shared/pagination.dart';

class TipsList {
  final List<Tip> tips;
  final Pagination pagination;

  TipsList({
    required this.tips,
    required this.pagination,
  });

  factory TipsList.fromJson(Map<String, dynamic> json) => TipsList(
        tips: tipsFromJson(json["data"]),
        pagination: Pagination.fromJson(json["meta"]["pagination"]),
      );
}
