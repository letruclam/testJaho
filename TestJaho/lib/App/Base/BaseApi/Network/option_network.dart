

import 'dart:developer';

import 'package:dio/dio.dart';

class OptionNetWork {
  final options  = Options(
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: "application/json");

   printKV(String key, Object v) {
    logPrint('$key: $v');
  }

   logPrint(String s) {
    log(s);
  }

   printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}

final optionNetWork = OptionNetWork();