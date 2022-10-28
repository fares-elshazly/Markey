import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'tags_service.chopper.dart';

@ChopperApi()
abstract class TagsService extends ChopperService {
  static TagsService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$TagsService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$TagsService(client);
  }

  @Get(path: Endpoints.tags)
  Future<Response> tags({@QueryMap() pagination});
}
