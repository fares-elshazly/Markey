import '/Models/Community/community.dart';
import '/Models/Shared/pagination.dart';

class CommunityList {
  final List<Community> communities;
  final Pagination pagination;

  CommunityList({
    required this.communities,
    required this.pagination,
  });

  factory CommunityList.fromJson(Map<String, dynamic> json) => CommunityList(
        communities: communitiesFromJson(json["data"]),
        pagination: Pagination.fromJson(json["meta"]["pagination"]),
      );
}
