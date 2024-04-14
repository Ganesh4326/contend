// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_friend_requests_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManageFriendRequestsScreenState {
  List<String>? get friendRequests => throw _privateConstructorUsedError;
  List<Users>? get friendRequestsUsers => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  List<String>? get friendRequestNames => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String>? friendRequests,
            List<Users>? friendRequestsUsers,
            String? userId,
            List<String>? friendRequestNames)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<String>? friendRequests,
            List<Users>? friendRequestsUsers,
            String? userId,
            List<String>? friendRequestNames)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<String>? friendRequests,
            List<Users>? friendRequestsUsers,
            String? userId,
            List<String>? friendRequestNames)?
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
  $ManageFriendRequestsScreenStateCopyWith<ManageFriendRequestsScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageFriendRequestsScreenStateCopyWith<$Res> {
  factory $ManageFriendRequestsScreenStateCopyWith(
          ManageFriendRequestsScreenState value,
          $Res Function(ManageFriendRequestsScreenState) then) =
      _$ManageFriendRequestsScreenStateCopyWithImpl<$Res,
          ManageFriendRequestsScreenState>;
  @useResult
  $Res call(
      {List<String>? friendRequests,
      List<Users>? friendRequestsUsers,
      String? userId,
      List<String>? friendRequestNames});
}

/// @nodoc
class _$ManageFriendRequestsScreenStateCopyWithImpl<$Res,
        $Val extends ManageFriendRequestsScreenState>
    implements $ManageFriendRequestsScreenStateCopyWith<$Res> {
  _$ManageFriendRequestsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendRequests = freezed,
    Object? friendRequestsUsers = freezed,
    Object? userId = freezed,
    Object? friendRequestNames = freezed,
  }) {
    return _then(_value.copyWith(
      friendRequests: freezed == friendRequests
          ? _value.friendRequests
          : friendRequests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendRequestsUsers: freezed == friendRequestsUsers
          ? _value.friendRequestsUsers
          : friendRequestsUsers // ignore: cast_nullable_to_non_nullable
              as List<Users>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      friendRequestNames: freezed == friendRequestNames
          ? _value.friendRequestNames
          : friendRequestNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ManageFriendRequestsScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? friendRequests,
      List<Users>? friendRequestsUsers,
      String? userId,
      List<String>? friendRequestNames});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ManageFriendRequestsScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendRequests = freezed,
    Object? friendRequestsUsers = freezed,
    Object? userId = freezed,
    Object? friendRequestNames = freezed,
  }) {
    return _then(_$InitialImpl(
      friendRequests: freezed == friendRequests
          ? _value._friendRequests
          : friendRequests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendRequestsUsers: freezed == friendRequestsUsers
          ? _value._friendRequestsUsers
          : friendRequestsUsers // ignore: cast_nullable_to_non_nullable
              as List<Users>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      friendRequestNames: freezed == friendRequestNames
          ? _value._friendRequestNames
          : friendRequestNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<String>? friendRequests,
      final List<Users>? friendRequestsUsers,
      this.userId,
      final List<String>? friendRequestNames})
      : _friendRequests = friendRequests,
        _friendRequestsUsers = friendRequestsUsers,
        _friendRequestNames = friendRequestNames;

  final List<String>? _friendRequests;
  @override
  List<String>? get friendRequests {
    final value = _friendRequests;
    if (value == null) return null;
    if (_friendRequests is EqualUnmodifiableListView) return _friendRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Users>? _friendRequestsUsers;
  @override
  List<Users>? get friendRequestsUsers {
    final value = _friendRequestsUsers;
    if (value == null) return null;
    if (_friendRequestsUsers is EqualUnmodifiableListView)
      return _friendRequestsUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? userId;
  final List<String>? _friendRequestNames;
  @override
  List<String>? get friendRequestNames {
    final value = _friendRequestNames;
    if (value == null) return null;
    if (_friendRequestNames is EqualUnmodifiableListView)
      return _friendRequestNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManageFriendRequestsScreenState.initial(friendRequests: $friendRequests, friendRequestsUsers: $friendRequestsUsers, userId: $userId, friendRequestNames: $friendRequestNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._friendRequests, _friendRequests) &&
            const DeepCollectionEquality()
                .equals(other._friendRequestsUsers, _friendRequestsUsers) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._friendRequestNames, _friendRequestNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friendRequests),
      const DeepCollectionEquality().hash(_friendRequestsUsers),
      userId,
      const DeepCollectionEquality().hash(_friendRequestNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String>? friendRequests,
            List<Users>? friendRequestsUsers,
            String? userId,
            List<String>? friendRequestNames)
        initial,
  }) {
    return initial(
        friendRequests, friendRequestsUsers, userId, friendRequestNames);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<String>? friendRequests,
            List<Users>? friendRequestsUsers,
            String? userId,
            List<String>? friendRequestNames)?
        initial,
  }) {
    return initial?.call(
        friendRequests, friendRequestsUsers, userId, friendRequestNames);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<String>? friendRequests,
            List<Users>? friendRequestsUsers,
            String? userId,
            List<String>? friendRequestNames)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          friendRequests, friendRequestsUsers, userId, friendRequestNames);
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

abstract class _Initial implements ManageFriendRequestsScreenState {
  const factory _Initial(
      {final List<String>? friendRequests,
      final List<Users>? friendRequestsUsers,
      final String? userId,
      final List<String>? friendRequestNames}) = _$InitialImpl;

  @override
  List<String>? get friendRequests;
  @override
  List<Users>? get friendRequestsUsers;
  @override
  String? get userId;
  @override
  List<String>? get friendRequestNames;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
