import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'profile_service.chopper.dart';

@ChopperApi()
abstract class ProfileService extends ChopperService {
  static ProfileService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$ProfileService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$ProfileService(client);
  }

  @multipart
  @Post(path: Endpoints.addPreviousWork)
  Future<Response> addPreviousWork(@PartFile() String image, @Part('user_id') int userId);

  @Delete(path: Endpoints.deletePreviousWork, optionalBody: true)
  Future<Response> deletePreviousWork(@Path() int id);

  @multipart
  @Post(path: Endpoints.addCertificate)
  Future<Response> addCertificate(@PartFile() String image, @Part('user_id') int userId);

  @Delete(path: Endpoints.deleteCertificate, optionalBody: true)
  Future<Response> deleteCertificate(@Path() int id);

  @Post(path: Endpoints.addPackage)
  Future<Response> addPackage(@Body() Map<String, dynamic> body);

  @Delete(path: Endpoints.deletePackage, optionalBody: true)
  Future<Response> deletePackage(@Path() int id);

  @Post(path: Endpoints.becomeExpert)
  Future<Response> becomeExpert(@Body() Map<String, dynamic> body);
}
