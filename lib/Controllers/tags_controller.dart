import 'package:get/get.dart';

import '/DTOs/Shared/pagination.dart';
import '/Models/Tags/tags_list.dart';
import '/Services/Tags/tags_repository.dart';

class TagsController extends GetxController {
  late TagsRepository _repository;

  final Rxn<TagsList> _tagsList = Rxn<TagsList>();

  Rxn<TagsList> get tagsList => _tagsList;

  TagsController() {
    _repository = TagsRepository();
  }

  Future<TagsList?> getTagsList(PaginationDTO dto) async {
    try {
      final tagsList = await _repository.tags(dto);
      if (dto.page > 1) {
        tagsList.tags.insertAll(0, _tagsList.value?.tags ?? []);
      }
      _tagsList.value = tagsList;
      return _tagsList.value;
    } catch (error) {
      rethrow;
    }
  }
}
