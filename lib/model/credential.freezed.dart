// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Credential {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CredentialCopyWith<Credential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialCopyWith<$Res> {
  factory $CredentialCopyWith(
          Credential value, $Res Function(Credential) then) =
      _$CredentialCopyWithImpl<$Res>;
  $Res call({String username, String password});
}

/// @nodoc
class _$CredentialCopyWithImpl<$Res> implements $CredentialCopyWith<$Res> {
  _$CredentialCopyWithImpl(this._value, this._then);

  final Credential _value;
  // ignore: unused_field
  final $Res Function(Credential) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CredentialCopyWith<$Res>
    implements $CredentialCopyWith<$Res> {
  factory _$$_CredentialCopyWith(
          _$_Credential value, $Res Function(_$_Credential) then) =
      __$$_CredentialCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password});
}

/// @nodoc
class __$$_CredentialCopyWithImpl<$Res> extends _$CredentialCopyWithImpl<$Res>
    implements _$$_CredentialCopyWith<$Res> {
  __$$_CredentialCopyWithImpl(
      _$_Credential _value, $Res Function(_$_Credential) _then)
      : super(_value, (v) => _then(v as _$_Credential));

  @override
  _$_Credential get _value => super._value as _$_Credential;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_Credential(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Credential implements _Credential {
  _$_Credential({required this.username, required this.password})
      : assert(RegExp(r'^[0-9a-zA-Z]*$').hasMatch(username),
            'usernameプロパティに使用できない文字が含まれています'),
        assert(RegExp(r'^[0-9a-zA-Z]*$').hasMatch(password),
            'passwordプロパティに使用できない文字が含まれています');

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'Credential(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Credential &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_CredentialCopyWith<_$_Credential> get copyWith =>
      __$$_CredentialCopyWithImpl<_$_Credential>(this, _$identity);
}

abstract class _Credential implements Credential {
  factory _Credential(
      {required final String username,
      required final String password}) = _$_Credential;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CredentialCopyWith<_$_Credential> get copyWith =>
      throw _privateConstructorUsedError;
}
