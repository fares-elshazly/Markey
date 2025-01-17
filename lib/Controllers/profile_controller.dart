import 'package:get/get.dart';

import '/DTOs/Profile/add_previous_work.dart';
import '/DTOs/Profile/add_certificate.dart';
import '/DTOs/Profile/add_package.dart';
import '/DTOs/Profile/become_expert.dart';
import '/Models/Profile/profile.dart';
import '/Services/Profile/profile_repository.dart';

class ProfileController extends GetxController {
  late ProfileRepository _repository;

  final Rxn<Profile> _expert = Rxn<Profile>();

  Rxn<Profile> get expert => _expert;

  ProfileController() {
    _repository = ProfileRepository();
  }

  Future<void> getExpertProfile(int id) async {
    try {
      final profile = await _repository.expertProfile(id);
      _expert.value = profile;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> addPreviousWork(AddPreviousWorkDTO dto) async {
    try {
      final isSuccess = await _repository.addPreviousWork(dto);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deletePreviousWork(int id) async {
    try {
      final isSuccess = await _repository.deletePreviousWork(id);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> addCertificate(AddCertificateDTO dto) async {
    try {
      final isSuccess = await _repository.addCertificate(dto);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deleteCertificate(int id) async {
    try {
      final isSuccess = await _repository.deleteCertificate(id);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> addPackage(AddPackageDTO dto) async {
    try {
      final isSuccess = await _repository.addPackage(dto);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deletePackage(int id) async {
    try {
      final isSuccess = await _repository.deletePackage(id);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> becomeExpert(BecomeExpertDTO dto) async {
    try {
      final isSuccess = await _repository.becomeExpert(dto);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }
}
