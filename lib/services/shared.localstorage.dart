import 'package:shared_preferences/shared_preferences.dart';
import 'localstorage.interface.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case bool:
        shared.setBool(key, value);
        break;
      case int:
        shared.setInt(key, value);
        break;
      case double:
        shared.setDouble(key, value);
        break;
      case String:
        shared.setString(key, value);
        break;
      default:
        throw Error();
    }
  }
}
