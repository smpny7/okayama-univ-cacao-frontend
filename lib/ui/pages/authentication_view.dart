import 'package:cacao/provider/authentication_provider.dart';
import 'package:cacao/ui/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AuthenticationView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authenticationProvider = ref.watch(authenticationProvider.notifier);
    final _safePadding = useState(0.0);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      Future.delayed(Duration.zero,
          () => _safePadding.value = MediaQuery.of(context).padding.top);
      return _authenticationProvider.disposeCamera;
    }, const []);

    return Scaffold(
      backgroundColor: HexColor('#F4FFFD'),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: _authenticationProvider.setupCamera,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 16,
                borderLength: 24,
                borderWidth: 8,
              ),
            ),
          ),
          Container(height: 40),
          Text(
            'QRコードを読み取ってください',
            style: TextStyle(
              color: HexColor('#3F3F3F'),
              letterSpacing: 2,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 35),
          Button(
            text: 'キャンセル',
            onTapped: () => _authenticationProvider.goBack(),
          ),
          Container(height: _safePadding.value / 2 + 30),
        ],
      ),
    );
  }
}
