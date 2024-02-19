// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_friends_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsersFriendsScreenState {
  List<String>? get friendListIds => throw _privateConstructorUsedError;
  List<Users>? get friendListUsers => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  List<String>? get friendsNames => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String>? friendListIds,
            List<Users>? friendListUsers,
            String? userId,
            List<String>? friendsNames)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? friendListIds, List<Users>? friendListUsers,
            String? userId, List<String>? friendsNames)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? friendListIds, List<Users>? friendListUsers,
            String? userId, List<String>? friendsNames)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersFriendsScreenStateCopyWith<UsersFriendsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersFriendsScreenStateCopyWith<$Res> {
  factory $UsersFriendsScreenStateCopyWith(UsersFriendsScreenState value,
          $Res Function(UsersFriendsScreenState) then) =
      _$UsersFriendsScreenStateCopyWithImpl<$Res, UsersFriendsScreenState>;
  @useResult
  $Res call(
      {List<String>? friendListIds,
      List<Users>? friendListUsers,
      String? userId,
      List<String>? friendsNames});
}

/// @nodoc
class _$UsersFriendsScreenStateCopyWithImpl<$Res,
        $Val extends UsersFriendsScreenState>
    implements $UsersFriendsScreenStateCopyWith<$Res> {
  _$UsersFriendsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendListIds = freezed,
    Object? friendListUsers = freezed,
    Object? userId = freezed,
    Object? friendsNames = freezed,
  }) {
    return _then(_value.copyWith(
      friendListIds: freezed == friendListIds
          ? _value.friendListIds
          : friendListIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendListUsers: freezed == friendListUsers
          ? _value.friendListUsers
          : friendListUsers // ignore: cast_nullable_to_non_nullable
              as List<Users>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      friendsNames: freezed == friendsNames
          ? _value.friendsNames
          : friendsNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UsersFriendsScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? friendListIds,
      List<Users>? friendListUsers,
      String? userId,
      List<String>? friendsNames});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UsersFriendsScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendListIds = freezed,
    Object? friendListUsers = freezed,
    Object? userId = freezed,
    Object? friendsNames = freezed,
  }) {
    return _then(_$InitialImpl(
      friendListIds: freezed == friendListIds
          ? _value._friendListIds
          : friendListIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendListUsers: freezed == friendListUsers
          ? _value._friendListUsers
          : friendListUsers // ignore: cast_nullable_to_non_nullable
              as List<Users>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      friendsNames: freezed == friendsNames
          ? _value._friendsNames
          : friendsNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<String>? friendListIds,
      final List<Users>? friendListUsers,
      this.userId,
      final List<String>? friendsNames})
      : _friendListIds = friendListIds,
        _friendListUsers = friendListUsers,
        _friendsNames = friendsNames;

  final List<String>? _friendListIds;
  @override
  List<String>? get friendListIds {
    final value = _friendListIds;
    if (value == null) return null;
    if (_friendListIds is EqualUnmodifiableListView) return _friendListIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Users>? _friendListUsers;
  @override
  List<Users>? get friendListUsers {
    final value = _friendListUsers;
    if (value == null) return null;
    if (_friendListUsers is EqualUnmodifiableListView) return _friendListUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? userId;
  final List<String>? _friendsNames;
  @override
  List<String>? get friendsNames {
    final value = _friendsNames;
    if (value == null) return null;
    if (_friendsNames is EqualUnmodifiableListView) return _friendsNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UsersFriendsScreenState.initial(friendListIds: $friendListIds, friendListUsers: $friendListUsers, userId: $userId, friendsNames: $friendsNames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._friendListIds, _friendListIds) &&
            const DeepCollectionEquality()
                .equals(other._friendListUsers, _friendListUsers) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._friendsNames, _friendsNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friendListIds),
      const DeepCollectionEquality().hash(_friendListUsers),
      userId,
      const DeepCollectionEquality().hash(_friendsNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String>? friendListIds,
            List<Users>? friendListUsers,
            String? userId,
            List<String>? friendsNames)
        initial,
  }) {
    return initial(friendListIds, friendListUsers, userId, friendsNames);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? friendListIds, List<Users>? friendListUsers,
            String? userId, List<String>? friendsNames)?
        initial,
  }) {
    return initial?.call(friendListIds, friendListUsers, userId, friendsNames);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? friendListIds, List<Users>? friendListUsers,
            String? userId, List<String>? friendsNames)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(friendListIds, friendListUsers, userId, friendsNames);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UsersFriendsScreenState {
  const factory _Initial(
      {final List<String>? friendListIds,
      final List<Users>? friendListUsers,
      final String? userId,
      final List<String>? friendsNames}) = _$InitialImpl;

  @override
  List<String>? get friendListIds;
  @override
  List<Users>? get friendListUsers;
  @override
  String? get userId;
  @override
  List<String>? get friendsNames;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
