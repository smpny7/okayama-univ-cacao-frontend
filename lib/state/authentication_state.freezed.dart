// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  bool get isPausingCamera => throw _privateConstructorUsedError;
  QRViewController? get qrViewController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
  $Res call({bool isPausingCamera, QRViewController? qrViewController});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;

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
abstract class _$$_AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_AuthenticationStateCopyWith(_$_AuthenticationState value,
          $Res Function(_$_AuthenticationState) then) =
      __$$_AuthenticationStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isPausingCamera, QRViewController? qrViewController});
}

/// @nodoc
class __$$_AuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_AuthenticationStateCopyWith<$Res> {
  __$$_AuthenticationStateCopyWithImpl(_$_AuthenticationState _value,
      $Res Function(_$_AuthenticationState) _then)
      : super(_value, (v) => _then(v as _$_AuthenticationState));

  @override
  _$_AuthenticationState get _value => super._value as _$_AuthenticationState;

  @override
  $Res call({
    Object? isPausingCamera = freezed,
    Object? qrViewController = freezed,
  }) {
    return _then(_$_AuthenticationState(
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

class _$_AuthenticationState implements _AuthenticationState {
  const _$_AuthenticationState(
      {this.isPausingCamera = false, this.qrViewController = null});

  @override
  @JsonKey()
  final bool isPausingCamera;
  @override
  @JsonKey()
  final QRViewController? qrViewController;

  @override
  String toString() {
    return 'AuthenticationState(isPausingCamera: $isPausingCamera, qrViewController: $qrViewController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationState &&
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
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      __$$_AuthenticationStateCopyWithImpl<_$_AuthenticationState>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
      {final bool isPausingCamera,
      final QRViewController? qrViewController}) = _$_AuthenticationState;

  @override
  bool get isPausingCamera => throw _privateConstructorUsedError;
  @override
  QRViewController? get qrViewController => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}
