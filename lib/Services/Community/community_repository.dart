import 'community_service.dart';

import '/DTOs/Shared/pagination.dart';
import '/DTOs/Community/add_community.dart';
import '/DTOs/Community/rate_community.dart';
import '/Models/Community/community_list.dart';
import '/Models/Shared/message_exception.dart';

class CommunityRepository {
  late CommunityService _communityService;

  CommunityRepository() {
    _communityService = CommunityService.create();
  }

  Future<CommunityList> communities(PaginationDTO dto) async {
    final pagination = dto.toJson();
    final response = await _communityService.communities(pagination: pagination);
    try {
      final communities = CommunityList.fromJson(response.body);
      return communities;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<bool> addCommunity(AddCommunityDTO dto) async {
    final body = dto.toJson();
    final response = await _communityService.addCommunity(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> rateCommunity(RateCommunityDTO dto) async {
    final body = dto.toJson();
    final response = await _communityService.rateCommunity(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }
}
