import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'community_service.chopper.dart';

@ChopperApi()
abstract class CommunityService extends ChopperService {
  static CommunityService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$CommunityService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$CommunityService(client);
  }

  @Get(path: Endpoints.communities)
  Future<Response> communities({@QueryMap() pagination});

  @Post(path: Endpoints.addCommunity)
  Future<Response> addCommunity(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.rateCommunity)
  Future<Response> rateCommunity(@Body() Map<String, dynamic> body);
}
