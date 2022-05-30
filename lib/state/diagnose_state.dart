import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnose_state.freezed.dart';

@freezed
class DiagnoseState with _$DiagnoseState {
  const factory DiagnoseState({
    @Default(false) bool isInGoodShape,
    @Default(false) bool isNoSuffocation,
    @Default(false) bool isNotFeelTired,
  }) = _DiagnoseState;
}
