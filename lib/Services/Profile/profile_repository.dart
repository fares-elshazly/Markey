import 'profile_service.dart';

import '/DTOs/Profile/add_previous_work.dart';
import '/DTOs/Profile/add_certificate.dart';
import '/DTOs/Profile/add_package.dart';
import '/DTOs/Profile/become_expert.dart';
import '/Models/Shared/message_exception.dart';

class ProfileRepository {
  late ProfileService _profileService;

  ProfileRepository() {
    _profileService = ProfileService.create();
  }

  Future<bool> addPreviousWork(AddPreviousWorkDTO dto) async {
    final response = await _profileService.addPreviousWork(dto.image, dto.userId);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> deletePreviousWork(int id) async {
    final response = await _profileService.deletePreviousWork(id);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> addCertificate(AddCertificateDTO dto) async {
    final response = await _profileService.addCertificate(dto.image, dto.userId);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> deleteCertificate(int id) async {
    final response = await _profileService.deleteCertificate(id);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> addPackage(AddPackageDTO dto) async {
    final body = dto.toJson();
    final response = await _profileService.addPackage(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> deletePackage(int id) async {
    final response = await _profileService.deletePackage(id);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<bool> becomeExpert(BecomeExpertDTO dto) async {
    final body = dto.toJson();
    final response = await _profileService.becomeExpert(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }
}
