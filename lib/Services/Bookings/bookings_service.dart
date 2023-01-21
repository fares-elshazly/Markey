import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'bookings_service.chopper.dart';

@ChopperApi()
abstract class BookingsService extends ChopperService {
  static BookingsService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$BookingsService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$BookingsService(client);
  }

  @Post(path: Endpoints.book)
  Future<Response> book(@Body() Map<String, dynamic> body);
}
