import 'package:cacao/get_it.dart';
import 'package:cacao/state/temperature_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TemperatureViewModel extends StateNotifier<TemperatureState> {
  TemperatureViewModel() : super(const TemperatureState());

  final NavigationService _navigationService = locator<NavigationService>();

  void onLoad() =>
      state = TemperatureState(inputDisabledState: _initialInputDisabledState);

  void onPressedButton(InputType inputType) {
    var unitDigit = state.unitDigit;
    var decimalPlace = state.decimalPlace;

    if (inputType == InputType.delete) {
      if (decimalPlace != null)
        state = TemperatureState(
            unitDigit: unitDigit,
            decimalPlace: null,
            inputDisabledState: unitDigit == 7
                ? _thirtySevenInputDisabledState
                : InputDisabledState());
      else if (unitDigit != null)
        state = TemperatureState(
            unitDigit: null,
            decimalPlace: null,
            inputDisabledState: _initialInputDisabledState);
    } else {
      if (unitDigit == null)
        state = TemperatureState(
            unitDigit: inputType.value,
            decimalPlace: null,
            inputDisabledState: inputType.value == 7
                ? _thirtySevenInputDisabledState
                : InputDisabledState());
      else if (decimalPlace == null)
        state = TemperatureState(
            unitDigit: unitDigit,
            decimalPlace: inputType.value,
            inputDisabledState: _nonReceptionInputDisabledState);

      if (state.unitDigit != null && state.decimalPlace != null)
        _navigationService.pushNamed('/DiagnoseView');
    }
  }

  final _initialInputDisabledState =
      InputDisabledState(eight: true, nine: true, delete: true);

  final _thirtySevenInputDisabledState = InputDisabledState(
      five: true, six: true, seven: true, eight: true, nine: true);

  final _nonReceptionInputDisabledState = InputDisabledState(
      one: true,
      two: true,
      three: true,
      four: true,
      five: true,
      six: true,
      seven: true,
      eight: true,
      nine: true,
      zero: true);
}

enum InputType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  zero,
  delete,
}

extension InputTypeExt on InputType {
  int? get value {
    switch (this) {
      case InputType.one:
        return 1;
      case InputType.two:
        return 2;
      case InputType.three:
        return 3;
      case InputType.four:
        return 4;
      case InputType.five:
        return 5;
      case InputType.six:
        return 6;
      case InputType.seven:
        return 7;
      case InputType.eight:
        return 8;
      case InputType.nine:
        return 9;
      case InputType.zero:
        return 0;
      case InputType.delete:
        return null;
    }
  }
}
