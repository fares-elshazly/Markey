import 'package:get/get.dart';

import '/DTOs/Shared/pagination.dart';
import '/DTOs/Community/add_community.dart';
import '/DTOs/Community/rate_community.dart';
import '/Models/Community/community_list.dart';
import '/Services/Community/community_repository.dart';

class CommunityController extends GetxController {
  late CommunityRepository _repository;

  final Rxn<CommunityList> _communityList = Rxn<CommunityList>();

  Rxn<CommunityList> get communityList => _communityList;

  CommunityController() {
    _repository = CommunityRepository();
  }

  Future<CommunityList?> getCommunityList(PaginationDTO dto) async {
    try {
      final communityList = await _repository.communities(dto);
      if (dto.page > 1) {
        communityList.communities.insertAll(0, _communityList.value?.communities ?? []);
      }
      _communityList.value = communityList;
      return _communityList.value;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> addCommunity(AddCommunityDTO dto) async {
    try {
      final isSuccess = await _repository.addCommunity(dto);
      await getCommunityList(PaginationDTO(page: 1));
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> rateCommunity(RateCommunityDTO dto) async {
    try {
      final isSuccess = await _repository.rateCommunity(dto);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }
}
