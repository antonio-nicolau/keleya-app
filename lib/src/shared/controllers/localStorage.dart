import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? _preferences;

  Future<void> saveToken(String? token) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences?.setString('token', token.toString());
  }

  Future<String?> getLocalToken() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences?.containsKey('token') == true)
      return _preferences?.getString('token');
  }

  Future<bool?> removeToken() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences?.containsKey('token') == true)
      return _preferences?.remove('token');
  }
}
