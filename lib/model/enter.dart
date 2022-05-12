import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter.freezed.dart';
part 'enter.g.dart';

@freezed
abstract class Enter with _$Enter {
  const factory Enter({
    required bool success,
  }) = _Enter;

  factory Enter.fromJson(Map<String, dynamic> json) => _$EnterFromJson(json);
}
