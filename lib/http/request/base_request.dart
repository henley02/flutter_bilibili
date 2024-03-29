import 'package:flutter_bilibili/http/dao/login_dao.dart';

enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() {
    return "api.devio.org";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    print('url:${uri.toString()}');
    String? boardingPass = LoginDao.getBoardingPass();
    if (needLogin() && boardingPass != null) {
      // 需要登录的接口携带登录令牌
      addHeader(LoginDao.BOARDING_PASS, boardingPass);
    }
    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = Map();

  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = {
    "course-flag": "fa",
    "auth-token": "ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa",
  };

  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
