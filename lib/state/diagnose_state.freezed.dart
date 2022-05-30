// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diagnose_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiagnoseState {
  bool get isInGoodShape => throw _privateConstructorUsedError;
  bool get isNoSuffocation => throw _privateConstructorUsedError;
  bool get isNotFeelTired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiagnoseStateCopyWith<DiagnoseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnoseStateCopyWith<$Res> {
  factory $DiagnoseStateCopyWith(
          DiagnoseState value, $Res Function(DiagnoseState) then) =
      _$DiagnoseStateCopyWithImpl<$Res>;
  $Res call({bool isInGoodShape, bool isNoSuffocation, bool isNotFeelTired});
}

/// @nodoc
class _$DiagnoseStateCopyWithImpl<$Res>
    implements $DiagnoseStateCopyWith<$Res> {
  _$DiagnoseStateCopyWithImpl(this._value, this._then);

  final DiagnoseState _value;
  // ignore: unused_field
  final $Res Function(DiagnoseState) _then;

  @override
  $Res call({
    Object? isInGoodShape = freezed,
    Object? isNoSuffocation = freezed,
    Object? isNotFeelTired = freezed,
  }) {
    return _then(_value.copyWith(
      isInGoodShape: isInGoodShape == freezed
          ? _value.isInGoodShape
          : isInGoodShape // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoSuffocation: isNoSuffocation == freezed
          ? _value.isNoSuffocation
          : isNoSuffocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotFeelTired: isNotFeelTired == freezed
          ? _value.isNotFeelTired
          : isNotFeelTired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DiagnoseStateCopyWith<$Res>
    implements $DiagnoseStateCopyWith<$Res> {
  factory _$$_DiagnoseStateCopyWith(
          _$_DiagnoseState value, $Res Function(_$_DiagnoseState) then) =
      __$$_DiagnoseStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isInGoodShape, bool isNoSuffocation, bool isNotFeelTired});
}

/// @nodoc
class __$$_DiagnoseStateCopyWithImpl<$Res>
    extends _$DiagnoseStateCopyWithImpl<$Res>
    implements _$$_DiagnoseStateCopyWith<$Res> {
  __$$_DiagnoseStateCopyWithImpl(
      _$_DiagnoseState _value, $Res Function(_$_DiagnoseState) _then)
      : super(_value, (v) => _then(v as _$_DiagnoseState));

  @override
  _$_DiagnoseState get _value => super._value as _$_DiagnoseState;

  @override
  $Res call({
    Object? isInGoodShape = freezed,
    Object? isNoSuffocation = freezed,
    Object? isNotFeelTired = freezed,
  }) {
    return _then(_$_DiagnoseState(
      isInGoodShape: isInGoodShape == freezed
          ? _value.isInGoodShape
          : isInGoodShape // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoSuffocation: isNoSuffocation == freezed
          ? _value.isNoSuffocation
          : isNoSuffocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotFeelTired: isNotFeelTired == freezed
          ? _value.isNotFeelTired
          : isNotFeelTired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DiagnoseState implements _DiagnoseState {
  const _$_DiagnoseState(
      {this.isInGoodShape = false,
      this.isNoSuffocation = false,
      this.isNotFeelTired = false});

  @override
  @JsonKey()
  final bool isInGoodShape;
  @override
  @JsonKey()
  final bool isNoSuffocation;
  @override
  @JsonKey()
  final bool isNotFeelTired;

  @override
  String toString() {
    return 'DiagnoseState(isInGoodShape: $isInGoodShape, isNoSuffocation: $isNoSuffocation, isNotFeelTired: $isNotFeelTired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiagnoseState &&
            const DeepCollectionEquality()
                .equals(other.isInGoodShape, isInGoodShape) &&
            const DeepCollectionEquality()
                .equals(other.isNoSuffocation, isNoSuffocation) &&
            const DeepCollectionEquality()
                .equals(other.isNotFeelTired, isNotFeelTired));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isInGoodShape),
      const DeepCollectionEquality().hash(isNoSuffocation),
      const DeepCollectionEquality().hash(isNotFeelTired));

  @JsonKey(ignore: true)
  @override
  _$$_DiagnoseStateCopyWith<_$_DiagnoseState> get copyWith =>
      __$$_DiagnoseStateCopyWithImpl<_$_DiagnoseState>(this, _$identity);
}

abstract class _DiagnoseState implements DiagnoseState {
  const factory _DiagnoseState(
      {final bool isInGoodShape,
      final bool isNoSuffocation,
      final bool isNotFeelTired}) = _$_DiagnoseState;

  @override
  bool get isInGoodShape => throw _privateConstructorUsedError;
  @override
  bool get isNoSuffocation => throw _privateConstructorUsedError;
  @override
  bool get isNotFeelTired => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiagnoseStateCopyWith<_$_DiagnoseState> get copyWith =>
      throw _privateConstructorUsedError;
}
