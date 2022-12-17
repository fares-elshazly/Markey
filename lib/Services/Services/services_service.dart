import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'services_service.chopper.dart';

@ChopperApi()
abstract class ServicesService extends ChopperService {
  static ServicesService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$ServicesService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$ServicesService(client);
  }

  @Get(path: Endpoints.services)
  Future<Response> services({@QueryMap() pagination});

  @Get(path: Endpoints.experts)
  Future<Response> experts(@Query('services_ids') servicesIds, {@QueryMap() pagination});
}
