import 'package:freezed_annotation/freezed_annotation.dart';

part 'temperature_state.freezed.dart';

@freezed
class TemperatureState with _$TemperatureState {
  const factory TemperatureState({
    @Default(null) int? unitDigit,
    @Default(null) int? decimalPlace,
    @Default(InputDisabledState()) InputDisabledState inputDisabledState,
  }) = _TemperatureState;
}

@freezed
class InputDisabledState with _$InputDisabledState {
  const factory InputDisabledState({
    @Default(false) bool one,
    @Default(false) bool two,
    @Default(false) bool three,
    @Default(false) bool four,
    @Default(false) bool five,
    @Default(false) bool six,
    @Default(false) bool seven,
    @Default(false) bool eight,
    @Default(false) bool nine,
    @Default(false) bool zero,
    @Default(false) bool delete,
  }) = _InputDisabledState;
}
