// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'enter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Enter _$EnterFromJson(Map<String, dynamic> json) {
  return _Enter.fromJson(json);
}

/// @nodoc
mixin _$Enter {
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnterCopyWith<Enter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnterCopyWith<$Res> {
  factory $EnterCopyWith(Enter value, $Res Function(Enter) then) =
      _$EnterCopyWithImpl<$Res>;
  $Res call({bool success});
}

/// @nodoc
class _$EnterCopyWithImpl<$Res> implements $EnterCopyWith<$Res> {
  _$EnterCopyWithImpl(this._value, this._then);

  final Enter _value;
  // ignore: unused_field
  final $Res Function(Enter) _then;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_EnterCopyWith<$Res> implements $EnterCopyWith<$Res> {
  factory _$$_EnterCopyWith(_$_Enter value, $Res Function(_$_Enter) then) =
      __$$_EnterCopyWithImpl<$Res>;
  @override
  $Res call({bool success});
}

/// @nodoc
class __$$_EnterCopyWithImpl<$Res> extends _$EnterCopyWithImpl<$Res>
    implements _$$_EnterCopyWith<$Res> {
  __$$_EnterCopyWithImpl(_$_Enter _value, $Res Function(_$_Enter) _then)
      : super(_value, (v) => _then(v as _$_Enter));

  @override
  _$_Enter get _value => super._value as _$_Enter;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_$_Enter(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Enter implements _Enter {
  const _$_Enter({required this.success});

  factory _$_Enter.fromJson(Map<String, dynamic> json) =>
      _$$_EnterFromJson(json);

  @override
  final bool success;

  @override
  String toString() {
    return 'Enter(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Enter &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$$_EnterCopyWith<_$_Enter> get copyWith =>
      __$$_EnterCopyWithImpl<_$_Enter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnterToJson(this);
  }
}

abstract class _Enter implements Enter {
  const factory _Enter({required final bool success}) = _$_Enter;

  factory _Enter.fromJson(Map<String, dynamic> json) = _$_Enter.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EnterCopyWith<_$_Enter> get copyWith =>
      throw _privateConstructorUsedError;
}
