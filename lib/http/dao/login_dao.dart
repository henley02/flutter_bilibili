import 'package:flutter_bilibili/db/cache.dart';
import 'package:flutter_bilibili/http/config/index.dart';
import 'package:flutter_bilibili/http/core/hi_net.dart';
import 'package:flutter_bilibili/http/request/base_request.dart';
import 'package:flutter_bilibili/http/request/login_request.dart';
import 'package:flutter_bilibili/http/request/registration_request.dart';

enum LoginType {
  registration,
  login,
}

class LoginDao {
  static const String BOARDING_PASS = 'boarding-pass';
  static login({userName, password}) {
    return _send(userName, password, LoginType.login);
  }

  static registration({userName, password}) {
    return _send(userName, password, LoginType.registration);
  }

  static _send(String userName, String password, LoginType type) async {
    BaseRequest request;
    if (type == LoginType.registration) {
      request = RegistrationRequest();
      request.add("imoocId", Config.imoocId).add("orderId", Config.orderId);
    } else {
      request = LoginRequest();
    }
    request.add("userName", userName).add("password", password);
    var result = await HiNet.getInstance().fire(request);
    print(result);
    if (type == LoginType.login &&
        result['code'] == 0 &&
        result['data'] != null) {
      Cache.getInstance().setString(BOARDING_PASS, result['data']);
    }
    return result;
  }

  static getBoardingPass() {
    return Cache.getInstance().get(BOARDING_PASS);
  }
}
