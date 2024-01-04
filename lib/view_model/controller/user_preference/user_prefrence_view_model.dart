import 'package:getx_mvvm/models/login/LoginResponse.dart';
import 'package:getx_mvvm/res/common/constant/SharePref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(LoginResponse loginResponse) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(SharePref.token, loginResponse.token.toString());
    return true;
  }

  Future<LoginResponse> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SharePref.token);
    return LoginResponse(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
