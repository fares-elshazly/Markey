// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TagsService extends TagsService {
  _$TagsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TagsService;

  @override
  Future<Response<dynamic>> tags({dynamic pagination}) {
    final $url = 'tags';
    final $params = pagination;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
