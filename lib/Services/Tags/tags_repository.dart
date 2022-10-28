import 'tags_service.dart';

import '/DTOs/Shared/pagination.dart';
import '/Models/Tags/tags_list.dart';
import '/Models/Shared/message_exception.dart';

class TagsRepository {
  late TagsService _tagsService;

  TagsRepository() {
    _tagsService = TagsService.create();
  }

  Future<TagsList> tags({PaginationDTO? dto}) async {
    final response = await _tagsService.tags(pagination: dto?.toJson());
    try {
      final tags = TagsList.fromJson(response.body);
      return tags;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }
}
