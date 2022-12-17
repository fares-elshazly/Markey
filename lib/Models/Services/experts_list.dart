import '/Models/Profile/profile.dart';
import '/Models/Shared/pagination.dart';

class ExpertsList {
  final List<Profile> experts;
  final Pagination pagination;

  ExpertsList({
    required this.experts,
    required this.pagination,
  });

  factory ExpertsList.fromJson(Map<String, dynamic> json) => ExpertsList(
        experts: profilesFromJson(json["data"]),
        pagination: Pagination.fromJson(json["meta"]["pagination"]),
      );
}