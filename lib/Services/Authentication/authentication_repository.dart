import 'authentication_service.dart';

import '/Enums/settings.dart';
import '/DTOs/Authentication/register.dart';
import '/DTOs/Authentication/login.dart';
import '/Models/Authentication/user.dart';
import '/Models/Authentication/profile.dart';
import '/Models/Shared/message_exception.dart';

class AuthenticationRepository {
  late AuthenticationService _authenticationService;

  AuthenticationRepository() {
    _authenticationService = AuthenticationService.create();
  }

  Future<bool> register(RegisterDTO dto) async {
    final body = dto.toJson();
    final response = await _authenticationService.register(body);
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }

  Future<User> login(LoginDTO dto) async {
    final body = dto.toJson();
    final response = await _authenticationService.login(body);
    try {
      final user = User.fromJson(response.body[Settings.dataKey]);
      return user;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<Profile> profile() async {
    final response = await _authenticationService.profile();
    try {
      final profile = Profile.fromJson(response.body[Settings.dataKey]);
      return profile;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<bool> logout() async {
    final response = await _authenticationService.logout();
    if (response.isSuccessful) return true;
    throw MessageException(response.error.toString());
  }
}
