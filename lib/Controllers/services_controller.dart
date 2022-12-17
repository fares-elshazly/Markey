import 'package:get/get.dart';

import '/DTOs/Services/get_experts.dart';
import '/DTOs/Shared/pagination.dart';
import '/Models/Services/service.dart';
import '/Models/Services/experts_list.dart';
import '/Services/Services/services_repository.dart';

class ServicesController extends GetxController {
  late ServicesRepository _repository;

  final Rxn<List<Service>> _services = Rxn<List<Service>>();
  final Rxn<ExpertsList> _expertsList = Rxn<ExpertsList>();

  Rxn<List<Service>> get services => _services;
  Rxn<ExpertsList> get expertsList => _expertsList;

  ServicesController() {
    _repository = ServicesRepository();
  }

  Future<void> getServices(PaginationDTO dto) async {
    try {
      final services = await _repository.services(dto);
      _services.value = services;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getExpertsList(GetExpertsDTO expertsDto, PaginationDTO paginationDto) async {
    try {
      final expertsList = await _repository.experts(expertsDto, paginationDto);
      if (paginationDto.page > 1) {
        expertsList.experts.insertAll(0, _expertsList.value?.experts ?? []);
      }
      _expertsList.value = expertsList;
    } catch (error) {
      rethrow;
    }
  }
}