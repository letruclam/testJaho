import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:testjaho/App/Base/BaseApi/Network/option_network.dart'
as OPTION_NETWORK;

import '../../DataCore/core_keys.dart';
import '../BaseStorage/storage_helper.dart';
import 'method_api.dart';


class HttpHelper {
  static Dio? _client;

  static Future<Dio> _getInstance(MethodApi methodApi,Function(Options) options) async {
    _client ??= Dio();
    final optionsApi  = Options(
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        contentType: "application/json",
        method: methodApi.toString());
    options.call(optionsApi);
    return _client!;
  }

  static Future<Response> get(String url) async {
    var op = Options();
    OPTION_NETWORK.optionNetWork.printKV('GET_URL:', url);
    final instance = await _getInstance(MethodApi.GET,(p0) => op = p0);
    return instance.get(url,options: op);
  }
  static Future<Response> post(String url, {dynamic body}) async {
    var op = Options();
    OPTION_NETWORK.optionNetWork.printKV('POST_URL:', url);
    final instance = await _getInstance(MethodApi.POST,(p0) => op = p0);
    OPTION_NETWORK.optionNetWork.logPrint('BODY:');
    OPTION_NETWORK.optionNetWork.printAll(jsonEncode(body));
    return instance.post(url,data: body,options: op);
  }

}
