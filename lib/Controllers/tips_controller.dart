import 'package:get/get.dart';

import '/DTOs/Shared/pagination.dart';
import '/DTOs/Tips/add_tip.dart';
import '/DTOs/Tips/update_tip.dart';
import '/DTOs/Tips/rate_tip.dart';
import '/DTOs/Tips/spread_tip.dart';
import '/DTOs/Tips/report_tip.dart';
import '/Models/Tips/tips_list.dart';
import '/Services/Tips/tips_repository.dart';

class TipsController extends GetxController {
  late TipsRepository _repository;

  final Rxn<TipsList> _tipsList = Rxn<TipsList>();

  Rxn<TipsList> get tipsList => _tipsList;

  TipsController() {
    _repository = TipsRepository();
  }

  Future<TipsList?> getTipsList(PaginationDTO dto) async {
    try {
      final tipsList = await _repository.tips(dto);
      if (dto.page > 1) {
        tipsList.tips.insertAll(0, _tipsList.value?.tips ?? []);
      }
      _tipsList.value = tipsList;
      return _tipsList.value;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> addTip(AddTipDTO dto) async {
    try {
      final isSuccess = await _repository.addTip(dto);
      await getTipsList(PaginationDTO());
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> updateTip(UpdateTipDTO dto) async {
    try {
      final isSuccess = await _repository.updateTip(dto);
      await getTipsList(PaginationDTO());
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> rateTip(RateTipDTO dto) async {
    try {
      final isSuccess = await _repository.rateTip(dto);
      await getTipsList(PaginationDTO());
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> spreadTip(SpreadTipDTO dto) async {
    try {
      final isSuccess = await _repository.spreadTip(dto);
      await getTipsList(PaginationDTO());
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> reportTip(ReportTipDTO dto) async {
    try {
      final isSuccess = await _repository.reportTip(dto);
      await getTipsList(PaginationDTO());
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }
}
