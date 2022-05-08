import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  var localStorage;

  Future<SharedPreferencesRepository> init() async {
    var sharedPreferences = new SharedPreferencesRepository();
    sharedPreferences.localStorage = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  Future<String?> getClubName() async =>
      await localStorage.getString('club_name');

  Future<String?> getRoomName() async =>
      await localStorage.getString('room_name');

  void setRoomName(String roomName) async =>
      localStorage.setString('room_name', roomName);

  void removeRoomName() async => localStorage.remove('room_name');

  Future<String?> getAccessToken() async =>
      await localStorage.getString('access_token');

  void setAccessToken(String accessToken) async =>
      localStorage.setString('access_token', accessToken);

  void removeAccessToken() async => localStorage.remove('access_token');

  Future<String?> getRefreshToken() async =>
      await localStorage.getString('refresh_token');

  void setRefreshToken(String refreshToken) async =>
      localStorage.setString('refresh_token', refreshToken);

  void removeRefreshToken() async => localStorage.remove('refresh_token');
}
