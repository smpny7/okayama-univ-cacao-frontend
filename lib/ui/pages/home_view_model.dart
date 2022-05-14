import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cacao/get_it.dart';
import 'package:cacao/repository/local_data_source/shared_preferences.dart';
import 'package:cacao/repository/remote_data_source/api.dart';
import 'package:cacao/repository/remote_data_source/nfc.dart';
import 'package:cacao/state/home_state.dart';
import 'package:cacao/view/modal/forceLeave.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:vibration/vibration.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(const HomeState());

  final NavigationService _navigationService = locator<NavigationService>();

  void onLoad() {
    _checkIsValidAuth();
    _localStorageOptimizationForVersionUpgrade();
    _checkFelicaReader();
  }

  void onButtonPressed() {
    _getStudentStatus("12345678");
    // if (Platform.isIOS)
    //   _iOSFeliCaScan();
    // else if (Platform.isAndroid) {
    //   _navigationService
    //       .showScanModalBottomSheet(() => NfcManager.instance.stopSession());
    //   _androidFeliCaScan();
    // } else {
    //   Fluttertoast.showToast(
    //       msg: "対応していないプラットフォームです",
    //       gravity: ToastGravity.TOP,
    //       backgroundColor: Colors.white,
    //       textColor: HexColor('EA4288'),
    //       fontSize: 16);
    //   throw ('対応していないプラットフォームです');
    // }
  }

  void _checkIsValidAuth() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return;
    try {
      final hasValidToken = await API().hasValidAccessToken();
      if (!hasValidToken) {
        _logout();
        _navigateToTemperature();
      }
    } catch (_) {
      _logout();
      _navigateToTemperature();
    }
  }

  Future<void> _localStorageOptimizationForVersionUpgrade() async {
    var sharedPreferences = await SharedPreferencesRepository().init();
    final clubName = await sharedPreferences.getClubName();
    if (clubName != null) sharedPreferences.setRoomName(clubName);
  }

  Future<void> _checkFelicaReader() async {
    var hasFelicaReader = await NfcManager.instance.isAvailable();
    state = HomeState(hasFelicaReader: hasFelicaReader);
  }

  void _androidFeliCaScan() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      NfcF? nfcf = NfcF.from(tag);

      if (nfcf == null)
        throw ('FeliCaに非対応');
      else {
        _navigationService.goBack();
        var studentID = await NFC().readFelicaOnAndroid(nfcf);
        print(studentID);
        NfcManager.instance.stopSession();
        _getStudentStatus(studentID);
      }
    });
  }

  void _iOSFeliCaScan() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      FeliCa? felica = FeliCa.from(tag);

      if (felica == null)
        throw ('FeliCaに非対応');
      else {
        var studentID = await NFC().readFelicaOniOS(felica);
        print(studentID);
        NfcManager.instance.stopSession();
        _getStudentStatus(studentID);
      }
    });
  }

  void _getStudentStatus(String studentID) async {
    try {
      var res = await API().getStudentStatus(studentID);
      var activeRoom = res.activeRoom;
      if (activeRoom == null)
        _navigationService.pushNamed('/BodyTemperature', studentID);
      else if (!res.isMyRoom)
        _navigationService.pushNamed('/BodyTemperature',
            ForceLeaveArguments(studentID: studentID, roomID: activeRoom));
      else
        _leaveRoom(studentID);
    } catch (_) {
      Fluttertoast.showToast(
          msg: "サーバーに接続できません",
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: HexColor('EA4288'),
          fontSize: 16);
    }
  }

  void _leaveRoom(studentID) async {
    var player = AudioCache();
    API().leaveRoom(studentID).then((_) async {
      player.play('sounds/success.mp3');
      if (await Vibration.hasVibrator() ?? false) Vibration.vibrate();
      _navigationService.popUntil('/HomeView');
      _navigationService.pushNamed('/LeaveSuccessfulModal');
    }).catchError((_) {
      _navigationService.popUntil('/HomeView');
      Fluttertoast.showToast(
          msg: "サーバーに接続できません",
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: HexColor('EA4288'),
          fontSize: 16);
    });
  }

  Future<void> _logout() async {
    var sharedPreferences = await SharedPreferencesRepository().init();
    sharedPreferences.removeAccessToken();
    sharedPreferences.removeRefreshToken();
    sharedPreferences.removeRoomName();
  }

  //TODO: 修正
  void _navigateToTemperature() {
    _navigationService.popUntil('/HomeView');
    _navigationService.pushReplacementNamed('/StartupView');
  }
}
