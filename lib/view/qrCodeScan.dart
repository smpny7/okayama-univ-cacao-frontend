import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i10jan/model/auth.dart';
import 'package:i10jan/view/component/bottomButtons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@immutable
class ConfirmViewArguments {
  const ConfirmViewArguments({required this.type, required this.data});

  final String type;
  final String data;
}

class QRCodeScan extends StatefulWidget {
  @override
  _QRCodeScanState createState() => _QRCodeScanState();
}

class _QRCodeScanState extends State<QRCodeScan> {
  QRViewController? _qrController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  bool _isQRScanned = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) _qrController?.pauseCamera();
    _qrController?.resumeCamera();
  }

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F4FFFD'),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 16,
                borderLength: 24,
                borderWidth: 8,
                // cutOutSize: scanArea,
              ),
            ),
          ),
          Container(height: 30),
          Text(
            'QRコードを読み取ってください',
            style: TextStyle(
              color: HexColor('#3F3F3F'),
              letterSpacing: 2,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 35),
          BottomButtons(true, false, true, 'キャンセル', null,
              () => Navigator.of(context).pop(), () => null)
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController qrController) {
    setState(() => _qrController = qrController);
    qrController.scannedDataStream.listen((scanData) =>
        _transitionToNextScreen(describeEnum(scanData.format), scanData.code));
  }

  Future<void> _transitionToNextScreen(String type, String data) async {
    if (!_isQRScanned) {
      _qrController?.pauseCamera();
      _isQRScanned = true;

      if (type != 'qrcode')
        Navigator.of(context).pushNamed('/AuthenticationFailed').then(
          (value) {
            _qrController?.resumeCamera();
            _isQRScanned = false;
          },
        );

      if (!RegExp(r'^[0-9a-zA-Z=&]*$').hasMatch(data))
        Navigator.of(context).pushNamed('/AuthenticationFailed').then(
          (value) {
            _qrController?.resumeCamera();
            _isQRScanned = false;
          },
        );

      var query = Uri.splitQueryString(data);

      if (query['id'] == null || query['password'] == null)
        Navigator.of(context).pushNamed('/AuthenticationFailed').then(
          (value) {
            _qrController?.resumeCamera();
            _isQRScanned = false;
          },
        );

      try {
        if (await Auth()
            .loginAndReturnIsSuccessful(query['id']!, query['password']!)
            .timeout(const Duration(seconds: 5))) {
          Navigator.of(context)
              .popUntil(ModalRoute.withName('/QRAuthentication'));
          Navigator.of(context).pushReplacementNamed('/Home');
        } else
          Navigator.of(context).pushNamed('/AuthenticationFailed').then(
            (value) {
              _qrController?.resumeCamera();
              _isQRScanned = false;
            },
          );
      } catch ($e) {
        Navigator.of(context).pushNamed('/NetworkErrorModal').then(
          (value) {
            _qrController?.resumeCamera();
            _isQRScanned = false;
          },
        );
      }
    }
  }
}
