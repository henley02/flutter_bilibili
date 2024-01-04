import 'package:shared_preferences/shared_preferences.dart';

///缓存管理类
class Cache {
  SharedPreferences? prefs;

  Cache._() {
    init();
  }

  static Cache? _instance;

  Cache._pre(SharedPreferences this.prefs);

  ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<Cache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = Cache._pre(prefs);
    }
    return _instance!;
  }

  static Cache getInstance() {
    _instance ??= Cache._();
    return _instance!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  ///存储String
  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  ///存储double
  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  ///存储int
  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  ///存储bool
  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  ///存储List<String>
  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  remove(String key) {
    prefs?.remove(key);
  }

  T? get<T>(String key) {
    var result = prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
