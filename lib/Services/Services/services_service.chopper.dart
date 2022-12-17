// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ServicesService extends ServicesService {
  _$ServicesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ServicesService;

  @override
  Future<Response<dynamic>> services({dynamic pagination}) {
    final $url = 'services';
    final $params = pagination;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> experts(dynamic servicesIds, {dynamic pagination}) {
    final $url = 'services/experts';
    final $params = <String, dynamic>{'services_ids': servicesIds};
    $params.addAll(pagination);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
