import 'dart:convert';

import 'package:flutter_bilibili/http/request/base_request.dart';

abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

///统一网络层返回格式
class HiNetResponse<T> {
  HiNetResponse({
    required this.request,
    this.statusCode,
    this.data,
    this.statusMessage,
    this.extra,
  });

  ///请求结果
  T? data;

  BaseRequest request;

  /// Http status code.
  int? statusCode;

  ///错误信息
  String? statusMessage;

  dynamic? extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
