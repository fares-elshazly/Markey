import 'tips_service.dart';

import '/DTOs/Shared/pagination.dart';
import '/DTOs/Tips/add_tip.dart';
import '/DTOs/Tips/update_tip.dart';
import '/DTOs/Tips/rate_tip.dart';
import '/DTOs/Tips/spread_tip.dart';
import '/DTOs/Tips/report_tip.dart';
import '/Models/Tips/tips_list.dart';
import '/Models/Shared/message_exception.dart';

class TipsRepository {
  late TipsService _tipsService;

  TipsRepository() {
    _tipsService = TipsService.create();
  }

  Future<TipsList> tips(PaginationDTO dto) async {
    final pagination = dto.toJson();
    final response = await _tipsService.tips(pagination: pagination);
    try {
      final tips = TipsList.fromJson(response.body);
      return tips;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<bool> addTip(AddTipDTO dto) async {
    final body = dto.toJson();
    final response = await _tipsService.addTip(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> updateTip(UpdateTipDTO dto) async {
    final id = dto.id;
    final body = dto.toJson();
    final response = await _tipsService.updateTip(id, body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> rateTip(RateTipDTO dto) async {
    final body = dto.toJson();
    final response = await _tipsService.rateTip(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> spreadTip(SpreadTipDTO dto) async {
    final body = dto.toJson();
    final response = await _tipsService.spreadTip(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> reportTip(ReportTipDTO dto) async {
    final body = dto.toJson();
    final response = await _tipsService.reportTip(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }
}
