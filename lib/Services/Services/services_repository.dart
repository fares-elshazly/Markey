import 'services_service.dart';

import '/Enums/settings.dart';
import '/DTOs/Shared/pagination.dart';
import '/DTOs/Services/get_experts.dart';
import '/Models/Services/service.dart';
import '/Models/Services/experts_list.dart';
import '/Models/Shared/message_exception.dart';

class ServicesRepository {
  late ServicesService _servicesService;

  ServicesRepository() {
    _servicesService = ServicesService.create();
  }

  Future<List<Service>> services(PaginationDTO dto) async {
    final pagination = dto.toJson();
    final response = await _servicesService.services(pagination: pagination);
    try {
      final services = servicesFromJson(response.body[Settings.dataKey]);
      return services;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<ExpertsList> experts(GetExpertsDTO expertsDto, PaginationDTO paginationDto) async {
    final servicesIds = expertsDto.servicesIds;
    final pagination = paginationDto.toJson();
    final response = await _servicesService.experts(servicesIds, pagination: pagination);
    try {
      final experts = ExpertsList.fromJson(response.body);
      return experts;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }
}
