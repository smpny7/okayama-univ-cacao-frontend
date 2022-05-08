import 'package:shared_preferences/shared_preferences.dart';

class Auth {

  logout() async {
    var localStorage = await SharedPreferences.getInstance();
    localStorage.remove('access_token');
    localStorage.remove('refresh_token');
    localStorage.remove('room_name');
    print('logout');
  }
}
