import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(false) bool isPausingCamera,
    @Default(null) QRViewController? qrViewController,
  }) = _AuthenticationState;
}
