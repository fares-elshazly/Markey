import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'authentication_service.chopper.dart';

@ChopperApi()
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$AuthenticationService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$AuthenticationService(client);
  }

  @Post(path: Endpoints.register)
  Future<Response> register(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.login)
  Future<Response> login(@Body() Map<String, dynamic> body);

  @Get(path: Endpoints.profile)
  Future<Response> profile();

  @Post(path: Endpoints.logout, optionalBody: true)
  Future<Response> logout();
}
