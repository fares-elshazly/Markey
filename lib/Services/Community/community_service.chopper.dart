// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CommunityService extends CommunityService {
  _$CommunityService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CommunityService;

  @override
  Future<Response<dynamic>> communities({dynamic pagination}) {
    final $url = 'communities';
    final $params = pagination;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addCommunity(Map<String, dynamic> body) {
    final $url = 'communities';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> rateCommunity(Map<String, dynamic> body) {
    final $url = 'communities/rate';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
