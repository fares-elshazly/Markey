import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/Enums/storage_keys.dart';
import '/DTOs/Authentication/register.dart';
import '/DTOs/Authentication/login.dart';
import '/Models/Authentication/user.dart';
import '/Models/Profile/profile.dart';
import '/Services/Authentication/authentication_repository.dart';

class AuthenticationController extends GetxController {
  late AuthenticationRepository _repository;
  late GetStorage _storage;

  final Rxn<User> _user = Rxn<User>();
  final Rxn<Profile> _profile = Rxn<Profile>();

  Rxn<User> get user => _user;
  String? get accessToken => _user.value?.token;
  Rxn<Profile> get profile => _profile;

  AuthenticationController() {
    _repository = AuthenticationRepository();
    _storage = GetStorage();
  }

  Future<bool> register(RegisterDTO dto) async {
    try {
      final isSuccess = await _repository.register(dto);
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  Future<User> login(LoginDTO dto) async {
    try {
      final user = await _repository.login(dto);
      await _saveUser(user);
      _user.value = user;
      return user;
    } catch (error) {
      _user.value = null;
      rethrow;
    }
  }

  Future<Profile> getProfile() async {
    try {
      final profile = await _repository.profile();
      _profile.value = profile;
      return profile;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> checkLoggedIn() async {
    try {
      final user = await _getUser();
      if (user == null) return false;
      _user.value = user;
      await getProfile();
      return true;
    } catch (error) {
      await logout();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final isSuccess = await _repository.logout();
      await _removeUser();
      return isSuccess;
    } catch (error) {
      await _removeUser();
      rethrow;
    }
  }

  Future<void> _saveUser(User user) async {
    final obj = user.toJson();
    return _storage.write(StorageKeys.user, obj);
  }

  Future<User?> _getUser() async {
    final obj = await _storage.read(StorageKeys.user);
    if (obj == null) return null;
    return User.fromJson(obj);
  }

  Future<void> _removeUser() async {
    await _storage.remove(StorageKeys.user);
  }
}
