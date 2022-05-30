// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  bool get success => throw _privateConstructorUsedError;
  StatusData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res>;
  $Res call({bool success, StatusData data});

  $StatusDataCopyWith<$Res> get data;
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  final Status _value;
  // ignore: unused_field
  final $Res Function(Status) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StatusData,
    ));
  }

  @override
  $StatusDataCopyWith<$Res> get data {
    return $StatusDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$_StatusCopyWith(_$_Status value, $Res Function(_$_Status) then) =
      __$$_StatusCopyWithImpl<$Res>;
  @override
  $Res call({bool success, StatusData data});

  @override
  $StatusDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_StatusCopyWithImpl<$Res> extends _$StatusCopyWithImpl<$Res>
    implements _$$_StatusCopyWith<$Res> {
  __$$_StatusCopyWithImpl(_$_Status _value, $Res Function(_$_Status) _then)
      : super(_value, (v) => _then(v as _$_Status));

  @override
  _$_Status get _value => super._value as _$_Status;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_Status(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StatusData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Status implements _Status {
  const _$_Status({required this.success, required this.data});

  factory _$_Status.fromJson(Map<String, dynamic> json) =>
      _$$_StatusFromJson(json);

  @override
  final bool success;
  @override
  final StatusData data;

  @override
  String toString() {
    return 'Status(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Status &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_StatusCopyWith<_$_Status> get copyWith =>
      __$$_StatusCopyWithImpl<_$_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusToJson(this);
  }
}

abstract class _Status implements Status {
  const factory _Status(
      {required final bool success,
      required final StatusData data}) = _$_Status;

  factory _Status.fromJson(Map<String, dynamic> json) = _$_Status.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  StatusData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StatusCopyWith<_$_Status> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusData _$StatusDataFromJson(Map<String, dynamic> json) {
  return _StatusData.fromJson(json);
}

/// @nodoc
mixin _$StatusData {
  @JsonKey(name: 'active_room')
  String? get activeRoom => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_my_room')
  bool get isMyRoom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusDataCopyWith<StatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusDataCopyWith<$Res> {
  factory $StatusDataCopyWith(
          StatusData value, $Res Function(StatusData) then) =
      _$StatusDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'active_room') String? activeRoom,
      @JsonKey(name: 'is_my_room') bool isMyRoom});
}

/// @nodoc
class _$StatusDataCopyWithImpl<$Res> implements $StatusDataCopyWith<$Res> {
  _$StatusDataCopyWithImpl(this._value, this._then);

  final StatusData _value;
  // ignore: unused_field
  final $Res Function(StatusData) _then;

  @override
  $Res call({
    Object? activeRoom = freezed,
    Object? isMyRoom = freezed,
  }) {
    return _then(_value.copyWith(
      activeRoom: activeRoom == freezed
          ? _value.activeRoom
          : activeRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      isMyRoom: isMyRoom == freezed
          ? _value.isMyRoom
          : isMyRoom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_StatusDataCopyWith<$Res>
    implements $StatusDataCopyWith<$Res> {
  factory _$$_StatusDataCopyWith(
          _$_StatusData value, $Res Function(_$_StatusData) then) =
      __$$_StatusDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'active_room') String? activeRoom,
      @JsonKey(name: 'is_my_room') bool isMyRoom});
}

/// @nodoc
class __$$_StatusDataCopyWithImpl<$Res> extends _$StatusDataCopyWithImpl<$Res>
    implements _$$_StatusDataCopyWith<$Res> {
  __$$_StatusDataCopyWithImpl(
      _$_StatusData _value, $Res Function(_$_StatusData) _then)
      : super(_value, (v) => _then(v as _$_StatusData));

  @override
  _$_StatusData get _value => super._value as _$_StatusData;

  @override
  $Res call({
    Object? activeRoom = freezed,
    Object? isMyRoom = freezed,
  }) {
    return _then(_$_StatusData(
      activeRoom: activeRoom == freezed
          ? _value.activeRoom
          : activeRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      isMyRoom: isMyRoom == freezed
          ? _value.isMyRoom
          : isMyRoom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatusData implements _StatusData {
  const _$_StatusData(
      {@JsonKey(name: 'active_room') required this.activeRoom,
      @JsonKey(name: 'is_my_room') required this.isMyRoom});

  factory _$_StatusData.fromJson(Map<String, dynamic> json) =>
      _$$_StatusDataFromJson(json);

  @override
  @JsonKey(name: 'active_room')
  final String? activeRoom;
  @override
  @JsonKey(name: 'is_my_room')
  final bool isMyRoom;

  @override
  String toString() {
    return 'StatusData(activeRoom: $activeRoom, isMyRoom: $isMyRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusData &&
            const DeepCollectionEquality()
                .equals(other.activeRoom, activeRoom) &&
            const DeepCollectionEquality().equals(other.isMyRoom, isMyRoom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activeRoom),
      const DeepCollectionEquality().hash(isMyRoom));

  @JsonKey(ignore: true)
  @override
  _$$_StatusDataCopyWith<_$_StatusData> get copyWith =>
      __$$_StatusDataCopyWithImpl<_$_StatusData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusDataToJson(this);
  }
}

abstract class _StatusData implements StatusData {
  const factory _StatusData(
          {@JsonKey(name: 'active_room') required final String? activeRoom,
          @JsonKey(name: 'is_my_room') required final bool isMyRoom}) =
      _$_StatusData;

  factory _StatusData.fromJson(Map<String, dynamic> json) =
      _$_StatusData.fromJson;

  @override
  @JsonKey(name: 'active_room')
  String? get activeRoom => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_my_room')
  bool get isMyRoom => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StatusDataCopyWith<_$_StatusData> get copyWith =>
      throw _privateConstructorUsedError;
}
