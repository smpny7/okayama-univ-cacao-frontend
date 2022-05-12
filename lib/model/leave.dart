import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave.freezed.dart';
part 'leave.g.dart';

@freezed
abstract class Leave with _$Leave {
  const factory Leave({
    required bool success,
  }) = _Leave;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);
}
