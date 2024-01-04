import 'package:flutter_bilibili/http/core/dio_adapter.dart';
import 'package:flutter_bilibili/http/core/hi_error.dart';
import 'package:flutter_bilibili/http/core/hi_net_adapter.dart';
import 'package:flutter_bilibili/http/request/base_request.dart';

class HiNet {
  HiNet._();

  static HiNet? _instance;

  static HiNet getInstance() {
    _instance ??= HiNet._();
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    HiNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      // 其他的异常
      error = e;
      printLog(e);
    }
    if (response == null) {
      printLog(error);
    }
    var result = response?.data;
    var status = response?.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString());
      default:
        throw HiNetError(status ?? -1, result.toString(), data: result);
    }
  }

  Future<dynamic> send(BaseRequest request) async {
    printLog('url:${request.url()}');
    HiNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void printLog(log) {
    print('hiNet:$log');
  }
}
