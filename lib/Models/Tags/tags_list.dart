import '/Models/Tags/tag.dart';
import '/Models/Shared/pagination.dart';

class TagsList {
  final List<Tag> tags;
  final Pagination pagination;

  TagsList({
    required this.tags,
    required this.pagination,
  });

  factory TagsList.fromJson(Map<String, dynamic> json) => TagsList(
        tags: tagsFromJson(json["data"]),
        pagination: Pagination.fromJson(json["meta"]["pagination"]),
      );
}
