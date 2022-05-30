// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temperature_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TemperatureState {
  int? get unitDigit => throw _privateConstructorUsedError;
  int? get decimalPlace => throw _privateConstructorUsedError;
  InputDisabledState get inputDisabledState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemperatureStateCopyWith<TemperatureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemperatureStateCopyWith<$Res> {
  factory $TemperatureStateCopyWith(
          TemperatureState value, $Res Function(TemperatureState) then) =
      _$TemperatureStateCopyWithImpl<$Res>;
  $Res call(
      {int? unitDigit,
      int? decimalPlace,
      InputDisabledState inputDisabledState});

  $InputDisabledStateCopyWith<$Res> get inputDisabledState;
}

/// @nodoc
class _$TemperatureStateCopyWithImpl<$Res>
    implements $TemperatureStateCopyWith<$Res> {
  _$TemperatureStateCopyWithImpl(this._value, this._then);

  final TemperatureState _value;
  // ignore: unused_field
  final $Res Function(TemperatureState) _then;

  @override
  $Res call({
    Object? unitDigit = freezed,
    Object? decimalPlace = freezed,
    Object? inputDisabledState = freezed,
  }) {
    return _then(_value.copyWith(
      unitDigit: unitDigit == freezed
          ? _value.unitDigit
          : unitDigit // ignore: cast_nullable_to_non_nullable
              as int?,
      decimalPlace: decimalPlace == freezed
          ? _value.decimalPlace
          : decimalPlace // ignore: cast_nullable_to_non_nullable
              as int?,
      inputDisabledState: inputDisabledState == freezed
          ? _value.inputDisabledState
          : inputDisabledState // ignore: cast_nullable_to_non_nullable
              as InputDisabledState,
    ));
  }

  @override
  $InputDisabledStateCopyWith<$Res> get inputDisabledState {
    return $InputDisabledStateCopyWith<$Res>(_value.inputDisabledState,
        (value) {
      return _then(_value.copyWith(inputDisabledState: value));
    });
  }
}

/// @nodoc
abstract class _$$_TemperatureStateCopyWith<$Res>
    implements $TemperatureStateCopyWith<$Res> {
  factory _$$_TemperatureStateCopyWith(
          _$_TemperatureState value, $Res Function(_$_TemperatureState) then) =
      __$$_TemperatureStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? unitDigit,
      int? decimalPlace,
      InputDisabledState inputDisabledState});

  @override
  $InputDisabledStateCopyWith<$Res> get inputDisabledState;
}

/// @nodoc
class __$$_TemperatureStateCopyWithImpl<$Res>
    extends _$TemperatureStateCopyWithImpl<$Res>
    implements _$$_TemperatureStateCopyWith<$Res> {
  __$$_TemperatureStateCopyWithImpl(
      _$_TemperatureState _value, $Res Function(_$_TemperatureState) _then)
      : super(_value, (v) => _then(v as _$_TemperatureState));

  @override
  _$_TemperatureState get _value => super._value as _$_TemperatureState;

  @override
  $Res call({
    Object? unitDigit = freezed,
    Object? decimalPlace = freezed,
    Object? inputDisabledState = freezed,
  }) {
    return _then(_$_TemperatureState(
      unitDigit: unitDigit == freezed
          ? _value.unitDigit
          : unitDigit // ignore: cast_nullable_to_non_nullable
              as int?,
      decimalPlace: decimalPlace == freezed
          ? _value.decimalPlace
          : decimalPlace // ignore: cast_nullable_to_non_nullable
              as int?,
      inputDisabledState: inputDisabledState == freezed
          ? _value.inputDisabledState
          : inputDisabledState // ignore: cast_nullable_to_non_nullable
              as InputDisabledState,
    ));
  }
}

/// @nodoc

class _$_TemperatureState implements _TemperatureState {
  const _$_TemperatureState(
      {this.unitDigit = null,
      this.decimalPlace = null,
      this.inputDisabledState = const InputDisabledState()});

  @override
  @JsonKey()
  final int? unitDigit;
  @override
  @JsonKey()
  final int? decimalPlace;
  @override
  @JsonKey()
  final InputDisabledState inputDisabledState;

  @override
  String toString() {
    return 'TemperatureState(unitDigit: $unitDigit, decimalPlace: $decimalPlace, inputDisabledState: $inputDisabledState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemperatureState &&
            const DeepCollectionEquality().equals(other.unitDigit, unitDigit) &&
            const DeepCollectionEquality()
                .equals(other.decimalPlace, decimalPlace) &&
            const DeepCollectionEquality()
                .equals(other.inputDisabledState, inputDisabledState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unitDigit),
      const DeepCollectionEquality().hash(decimalPlace),
      const DeepCollectionEquality().hash(inputDisabledState));

  @JsonKey(ignore: true)
  @override
  _$$_TemperatureStateCopyWith<_$_TemperatureState> get copyWith =>
      __$$_TemperatureStateCopyWithImpl<_$_TemperatureState>(this, _$identity);
}

abstract class _TemperatureState implements TemperatureState {
  const factory _TemperatureState(
      {final int? unitDigit,
      final int? decimalPlace,
      final InputDisabledState inputDisabledState}) = _$_TemperatureState;

  @override
  int? get unitDigit => throw _privateConstructorUsedError;
  @override
  int? get decimalPlace => throw _privateConstructorUsedError;
  @override
  InputDisabledState get inputDisabledState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TemperatureStateCopyWith<_$_TemperatureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InputDisabledState {
  bool get one => throw _privateConstructorUsedError;
  bool get two => throw _privateConstructorUsedError;
  bool get three => throw _privateConstructorUsedError;
  bool get four => throw _privateConstructorUsedError;
  bool get five => throw _privateConstructorUsedError;
  bool get six => throw _privateConstructorUsedError;
  bool get seven => throw _privateConstructorUsedError;
  bool get eight => throw _privateConstructorUsedError;
  bool get nine => throw _privateConstructorUsedError;
  bool get zero => throw _privateConstructorUsedError;
  bool get delete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputDisabledStateCopyWith<InputDisabledState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputDisabledStateCopyWith<$Res> {
  factory $InputDisabledStateCopyWith(
          InputDisabledState value, $Res Function(InputDisabledState) then) =
      _$InputDisabledStateCopyWithImpl<$Res>;
  $Res call(
      {bool one,
      bool two,
      bool three,
      bool four,
      bool five,
      bool six,
      bool seven,
      bool eight,
      bool nine,
      bool zero,
      bool delete});
}

/// @nodoc
class _$InputDisabledStateCopyWithImpl<$Res>
    implements $InputDisabledStateCopyWith<$Res> {
  _$InputDisabledStateCopyWithImpl(this._value, this._then);

  final InputDisabledState _value;
  // ignore: unused_field
  final $Res Function(InputDisabledState) _then;

  @override
  $Res call({
    Object? one = freezed,
    Object? two = freezed,
    Object? three = freezed,
    Object? four = freezed,
    Object? five = freezed,
    Object? six = freezed,
    Object? seven = freezed,
    Object? eight = freezed,
    Object? nine = freezed,
    Object? zero = freezed,
    Object? delete = freezed,
  }) {
    return _then(_value.copyWith(
      one: one == freezed
          ? _value.one
          : one // ignore: cast_nullable_to_non_nullable
              as bool,
      two: two == freezed
          ? _value.two
          : two // ignore: cast_nullable_to_non_nullable
              as bool,
      three: three == freezed
          ? _value.three
          : three // ignore: cast_nullable_to_non_nullable
              as bool,
      four: four == freezed
          ? _value.four
          : four // ignore: cast_nullable_to_non_nullable
              as bool,
      five: five == freezed
          ? _value.five
          : five // ignore: cast_nullable_to_non_nullable
              as bool,
      six: six == freezed
          ? _value.six
          : six // ignore: cast_nullable_to_non_nullable
              as bool,
      seven: seven == freezed
          ? _value.seven
          : seven // ignore: cast_nullable_to_non_nullable
              as bool,
      eight: eight == freezed
          ? _value.eight
          : eight // ignore: cast_nullable_to_non_nullable
              as bool,
      nine: nine == freezed
          ? _value.nine
          : nine // ignore: cast_nullable_to_non_nullable
              as bool,
      zero: zero == freezed
          ? _value.zero
          : zero // ignore: cast_nullable_to_non_nullable
              as bool,
      delete: delete == freezed
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InputDisabledStateCopyWith<$Res>
    implements $InputDisabledStateCopyWith<$Res> {
  factory _$$_InputDisabledStateCopyWith(_$_InputDisabledState value,
          $Res Function(_$_InputDisabledState) then) =
      __$$_InputDisabledStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool one,
      bool two,
      bool three,
      bool four,
      bool five,
      bool six,
      bool seven,
      bool eight,
      bool nine,
      bool zero,
      bool delete});
}

/// @nodoc
class __$$_InputDisabledStateCopyWithImpl<$Res>
    extends _$InputDisabledStateCopyWithImpl<$Res>
    implements _$$_InputDisabledStateCopyWith<$Res> {
  __$$_InputDisabledStateCopyWithImpl(
      _$_InputDisabledState _value, $Res Function(_$_InputDisabledState) _then)
      : super(_value, (v) => _then(v as _$_InputDisabledState));

  @override
  _$_InputDisabledState get _value => super._value as _$_InputDisabledState;

  @override
  $Res call({
    Object? one = freezed,
    Object? two = freezed,
    Object? three = freezed,
    Object? four = freezed,
    Object? five = freezed,
    Object? six = freezed,
    Object? seven = freezed,
    Object? eight = freezed,
    Object? nine = freezed,
    Object? zero = freezed,
    Object? delete = freezed,
  }) {
    return _then(_$_InputDisabledState(
      one: one == freezed
          ? _value.one
          : one // ignore: cast_nullable_to_non_nullable
              as bool,
      two: two == freezed
          ? _value.two
          : two // ignore: cast_nullable_to_non_nullable
              as bool,
      three: three == freezed
          ? _value.three
          : three // ignore: cast_nullable_to_non_nullable
              as bool,
      four: four == freezed
          ? _value.four
          : four // ignore: cast_nullable_to_non_nullable
              as bool,
      five: five == freezed
          ? _value.five
          : five // ignore: cast_nullable_to_non_nullable
              as bool,
      six: six == freezed
          ? _value.six
          : six // ignore: cast_nullable_to_non_nullable
              as bool,
      seven: seven == freezed
          ? _value.seven
          : seven // ignore: cast_nullable_to_non_nullable
              as bool,
      eight: eight == freezed
          ? _value.eight
          : eight // ignore: cast_nullable_to_non_nullable
              as bool,
      nine: nine == freezed
          ? _value.nine
          : nine // ignore: cast_nullable_to_non_nullable
              as bool,
      zero: zero == freezed
          ? _value.zero
          : zero // ignore: cast_nullable_to_non_nullable
              as bool,
      delete: delete == freezed
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InputDisabledState implements _InputDisabledState {
  const _$_InputDisabledState(
      {this.one = false,
      this.two = false,
      this.three = false,
      this.four = false,
      this.five = false,
      this.six = false,
      this.seven = false,
      this.eight = false,
      this.nine = false,
      this.zero = false,
      this.delete = false});

  @override
  @JsonKey()
  final bool one;
  @override
  @JsonKey()
  final bool two;
  @override
  @JsonKey()
  final bool three;
  @override
  @JsonKey()
  final bool four;
  @override
  @JsonKey()
  final bool five;
  @override
  @JsonKey()
  final bool six;
  @override
  @JsonKey()
  final bool seven;
  @override
  @JsonKey()
  final bool eight;
  @override
  @JsonKey()
  final bool nine;
  @override
  @JsonKey()
  final bool zero;
  @override
  @JsonKey()
  final bool delete;

  @override
  String toString() {
    return 'InputDisabledState(one: $one, two: $two, three: $three, four: $four, five: $five, six: $six, seven: $seven, eight: $eight, nine: $nine, zero: $zero, delete: $delete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputDisabledState &&
            const DeepCollectionEquality().equals(other.one, one) &&
            const DeepCollectionEquality().equals(other.two, two) &&
            const DeepCollectionEquality().equals(other.three, three) &&
            const DeepCollectionEquality().equals(other.four, four) &&
            const DeepCollectionEquality().equals(other.five, five) &&
            const DeepCollectionEquality().equals(other.six, six) &&
            const DeepCollectionEquality().equals(other.seven, seven) &&
            const DeepCollectionEquality().equals(other.eight, eight) &&
            const DeepCollectionEquality().equals(other.nine, nine) &&
            const DeepCollectionEquality().equals(other.zero, zero) &&
            const DeepCollectionEquality().equals(other.delete, delete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(one),
      const DeepCollectionEquality().hash(two),
      const DeepCollectionEquality().hash(three),
      const DeepCollectionEquality().hash(four),
      const DeepCollectionEquality().hash(five),
      const DeepCollectionEquality().hash(six),
      const DeepCollectionEquality().hash(seven),
      const DeepCollectionEquality().hash(eight),
      const DeepCollectionEquality().hash(nine),
      const DeepCollectionEquality().hash(zero),
      const DeepCollectionEquality().hash(delete));

  @JsonKey(ignore: true)
  @override
  _$$_InputDisabledStateCopyWith<_$_InputDisabledState> get copyWith =>
      __$$_InputDisabledStateCopyWithImpl<_$_InputDisabledState>(
          this, _$identity);
}

abstract class _InputDisabledState implements InputDisabledState {
  const factory _InputDisabledState(
      {final bool one,
      final bool two,
      final bool three,
      final bool four,
      final bool five,
      final bool six,
      final bool seven,
      final bool eight,
      final bool nine,
      final bool zero,
      final bool delete}) = _$_InputDisabledState;

  @override
  bool get one => throw _privateConstructorUsedError;
  @override
  bool get two => throw _privateConstructorUsedError;
  @override
  bool get three => throw _privateConstructorUsedError;
  @override
  bool get four => throw _privateConstructorUsedError;
  @override
  bool get five => throw _privateConstructorUsedError;
  @override
  bool get six => throw _privateConstructorUsedError;
  @override
  bool get seven => throw _privateConstructorUsedError;
  @override
  bool get eight => throw _privateConstructorUsedError;
  @override
  bool get nine => throw _privateConstructorUsedError;
  @override
  bool get zero => throw _privateConstructorUsedError;
  @override
  bool get delete => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InputDisabledStateCopyWith<_$_InputDisabledState> get copyWith =>
      throw _privateConstructorUsedError;
}
