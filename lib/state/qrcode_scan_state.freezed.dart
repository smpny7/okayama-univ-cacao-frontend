// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qrcode_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QRCodeScanState {
  bool get isPausingCamera => throw _privateConstructorUsedError;
  QRViewController? get qrViewController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QRCodeScanStateCopyWith<QRCodeScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRCodeScanStateCopyWith<$Res> {
  factory $QRCodeScanStateCopyWith(
          QRCodeScanState value, $Res Function(QRCodeScanState) then) =
      _$QRCodeScanStateCopyWithImpl<$Res>;
  $Res call({bool isPausingCamera, QRViewController? qrViewController});
}

/// @nodoc
class _$QRCodeScanStateCopyWithImpl<$Res>
    implements $QRCodeScanStateCopyWith<$Res> {
  _$QRCodeScanStateCopyWithImpl(this._value, this._then);

  final QRCodeScanState _value;
  // ignore: unused_field
  final $Res Function(QRCodeScanState) _then;

  @override
  $Res call({
    Object? isPausingCamera = freezed,
    Object? qrViewController = freezed,
  }) {
    return _then(_value.copyWith(
      isPausingCamera: isPausingCamera == freezed
          ? _value.isPausingCamera
          : isPausingCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      qrViewController: qrViewController == freezed
          ? _value.qrViewController
          : qrViewController // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
    ));
  }
}

/// @nodoc
abstract class _$QRCodeScanStateCopyWith<$Res>
    implements $QRCodeScanStateCopyWith<$Res> {
  factory _$QRCodeScanStateCopyWith(
          _QRCodeScanState value, $Res Function(_QRCodeScanState) then) =
      __$QRCodeScanStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isPausingCamera, QRViewController? qrViewController});
}

/// @nodoc
class __$QRCodeScanStateCopyWithImpl<$Res>
    extends _$QRCodeScanStateCopyWithImpl<$Res>
    implements _$QRCodeScanStateCopyWith<$Res> {
  __$QRCodeScanStateCopyWithImpl(
      _QRCodeScanState _value, $Res Function(_QRCodeScanState) _then)
      : super(_value, (v) => _then(v as _QRCodeScanState));

  @override
  _QRCodeScanState get _value => super._value as _QRCodeScanState;

  @override
  $Res call({
    Object? isPausingCamera = freezed,
    Object? qrViewController = freezed,
  }) {
    return _then(_QRCodeScanState(
      isPausingCamera: isPausingCamera == freezed
          ? _value.isPausingCamera
          : isPausingCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      qrViewController: qrViewController == freezed
          ? _value.qrViewController
          : qrViewController // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
    ));
  }
}

/// @nodoc

class _$_QRCodeScanState implements _QRCodeScanState {
  const _$_QRCodeScanState(
      {this.isPausingCamera = false, this.qrViewController = null});

  @override
  @JsonKey()
  final bool isPausingCamera;
  @override
  @JsonKey()
  final QRViewController? qrViewController;

  @override
  String toString() {
    return 'QRCodeScanState(isPausingCamera: $isPausingCamera, qrViewController: $qrViewController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QRCodeScanState &&
            const DeepCollectionEquality()
                .equals(other.isPausingCamera, isPausingCamera) &&
            const DeepCollectionEquality()
                .equals(other.qrViewController, qrViewController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isPausingCamera),
      const DeepCollectionEquality().hash(qrViewController));

  @JsonKey(ignore: true)
  @override
  _$QRCodeScanStateCopyWith<_QRCodeScanState> get copyWith =>
      __$QRCodeScanStateCopyWithImpl<_QRCodeScanState>(this, _$identity);
}

abstract class _QRCodeScanState implements QRCodeScanState {
  const factory _QRCodeScanState(
      {final bool isPausingCamera,
      final QRViewController? qrViewController}) = _$_QRCodeScanState;

  @override
  bool get isPausingCamera => throw _privateConstructorUsedError;
  @override
  QRViewController? get qrViewController => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QRCodeScanStateCopyWith<_QRCodeScanState> get copyWith =>
      throw _privateConstructorUsedError;
}
