import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qrcode_scan_state.freezed.dart';

@freezed
class QRCodeScanState with _$QRCodeScanState {
  const factory QRCodeScanState({
    @Default(false) bool isPausingCamera,
    @Default(null) QRViewController? qrViewController,
  }) = _QRCodeScanState;
}
