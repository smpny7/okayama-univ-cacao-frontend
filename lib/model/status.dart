import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
abstract class Status with _$Status {
  const factory Status({
    required bool success,
    required StatusData data,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
abstract class StatusData with _$StatusData {
  const factory StatusData({
    @JsonKey(name: 'active_room') required String? activeRoom,
    @JsonKey(name: 'is_my_room') required bool isMyRoom,
  }) = _StatusData;

  factory StatusData.fromJson(Map<String, dynamic> json) => _$StatusDataFromJson(json);
}
