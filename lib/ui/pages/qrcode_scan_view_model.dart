import 'package:cacao/get_it.dart';
import 'package:cacao/model/auth.dart';
import 'package:cacao/state/qrcode_scan_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:riverpod/riverpod.dart';

class QRCodeScanViewModel extends StateNotifier<QRCodeScanState> {
  QRCodeScanViewModel() : super(const QRCodeScanState());

  final NavigationService _navigationService = locator<NavigationService>();

  void setupCamera(QRViewController qrViewController) {
    state = QRCodeScanState(qrViewController: qrViewController);
    state.qrViewController?.scannedDataStream.listen(
        (scanData) => _onScanned(describeEnum(scanData.format), scanData.code));
  }

  void _pauseCamera() {
    state = QRCodeScanState(isPausingCamera: true);
    state.qrViewController?.pauseCamera();
  }

  void _resumeCamera() {
    state = QRCodeScanState(isPausingCamera: false);
    state.qrViewController?.resumeCamera();
  }

  void disposeCamera() => state.qrViewController?.dispose();

  Future<void> _onScanned(String codeType, String? codeData) async {
    if (state.isPausingCamera) return;

    _pauseCamera();
    Fluttertoast.cancel();

    if (codeType != 'qrcode' ||
        codeData == null ||
        !RegExp(r'^[0-9a-zA-Z=&]*$').hasMatch(codeData)) {
      _showAuthenticationFailedToast();
      return;
    }

    var query = Uri.splitQueryString(codeData);

    if (query['id'] == null || query['password'] == null) {
      _showAuthenticationFailedToast();
      return;
    }

    try {
      if (await Auth()
          .loginAndReturnIsSuccessful(query['id']!, query['password']!))
        _navigateToHome();
      else
        _showAuthenticationFailedToast();
    } catch (_) {
      _showNetworkErrorToast();
    }
  }

  void goBack() => _navigationService.goBack();

  void _navigateToHome() {
    _navigationService.popUntil('/QRAuthentication');
    _navigationService.pushReplacementNamed('/Home');
  }

  Future<void> _showAuthenticationFailedToast() async {
    Fluttertoast.showToast(
        msg: "認証に失敗しました",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.white,
        textColor: HexColor('EA4288'),
        fontSize: 16);
    await new Future.delayed(new Duration(seconds: 4));
    _resumeCamera();
  }

  Future<void> _showNetworkErrorToast() async {
    Fluttertoast.showToast(
        msg: "サーバーに接続できません",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.white,
        textColor: HexColor('EA4288'),
        fontSize: 16);
    await new Future.delayed(new Duration(seconds: 4));
    _resumeCamera();
  }
}
