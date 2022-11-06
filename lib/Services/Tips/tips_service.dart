import 'package:chopper/chopper.dart';

import '/Enums/urls.dart';
import '/Enums/endpoints.dart';
import '/Services/Interceptors/authorization_interceptors.dart';

part 'tips_service.chopper.dart';

@ChopperApi()
abstract class TipsService extends ChopperService {
  static TipsService create() {
    final client = ChopperClient(
      baseUrl: Urls.api,
      services: [
        _$TipsService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        AuthorizationInterceptors.authorizationRequest,
        AuthorizationInterceptors.authorizationResponse,
      ],
      converter: const JsonConverter(),
    );
    return _$TipsService(client);
  }

  @Get(path: Endpoints.tips)
  Future<Response> tips({@QueryMap() pagination});

  @Post(path: Endpoints.addTip)
  Future<Response> addTip(@Body() Map<String, dynamic> body);

  @Put(path: Endpoints.updateTip)
  Future<Response> updateTip(@Path() int id, @Body() Map<String, dynamic> body);

  @Post(path: Endpoints.rateTip)
  Future<Response> rateTip(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.spreadTip)
  Future<Response> spreadTip(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.reportTip)
  Future<Response> reportTip(@Body() Map<String, dynamic> body);
}
