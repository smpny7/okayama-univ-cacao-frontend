// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'leave.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Leave _$LeaveFromJson(Map<String, dynamic> json) {
  return _Leave.fromJson(json);
}

/// @nodoc
mixin _$Leave {
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveCopyWith<Leave> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveCopyWith<$Res> {
  factory $LeaveCopyWith(Leave value, $Res Function(Leave) then) =
      _$LeaveCopyWithImpl<$Res>;
  $Res call({bool success});
}

/// @nodoc
class _$LeaveCopyWithImpl<$Res> implements $LeaveCopyWith<$Res> {
  _$LeaveCopyWithImpl(this._value, this._then);

  final Leave _value;
  // ignore: unused_field
  final $Res Function(Leave) _then;

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
abstract class _$LeaveCopyWith<$Res> implements $LeaveCopyWith<$Res> {
  factory _$LeaveCopyWith(_Leave value, $Res Function(_Leave) then) =
      __$LeaveCopyWithImpl<$Res>;
  @override
  $Res call({bool success});
}

/// @nodoc
class __$LeaveCopyWithImpl<$Res> extends _$LeaveCopyWithImpl<$Res>
    implements _$LeaveCopyWith<$Res> {
  __$LeaveCopyWithImpl(_Leave _value, $Res Function(_Leave) _then)
      : super(_value, (v) => _then(v as _Leave));

  @override
  _Leave get _value => super._value as _Leave;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_Leave(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Leave implements _Leave {
  const _$_Leave({required this.success});

  factory _$_Leave.fromJson(Map<String, dynamic> json) =>
      _$$_LeaveFromJson(json);

  @override
  final bool success;

  @override
  String toString() {
    return 'Leave(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Leave &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$LeaveCopyWith<_Leave> get copyWith =>
      __$LeaveCopyWithImpl<_Leave>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeaveToJson(this);
  }
}

abstract class _Leave implements Leave {
  const factory _Leave({required final bool success}) = _$_Leave;

  factory _Leave.fromJson(Map<String, dynamic> json) = _$_Leave.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LeaveCopyWith<_Leave> get copyWith => throw _privateConstructorUsedError;
}
