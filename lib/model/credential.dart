import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.freezed.dart';

@freezed
abstract class Credential with _$Credential {
  @Assert('RegExp(r\'^[0-9a-zA-Z]*\$\').hasMatch(username)',
      'usernameプロパティに使用できない文字が含まれています')
  @Assert('RegExp(r\'^[0-9a-zA-Z]*\$\').hasMatch(password)',
      'passwordプロパティに使用できない文字が含まれています')
  factory Credential({
    required String username,
    required String password,
  }) = _Credential;
}
