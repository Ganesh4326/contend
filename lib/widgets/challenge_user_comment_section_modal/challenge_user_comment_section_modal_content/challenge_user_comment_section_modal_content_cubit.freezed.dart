// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_user_comment_section_modal_content_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChallengeUserCommentSectionModalContentState {
  String? get challengeId => throw _privateConstructorUsedError;
  List<ChallengeComment>? get comments => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? challengeId, List<ChallengeComment>? comments)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? challengeId, List<ChallengeComment>? comments)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? challengeId, List<ChallengeComment>? comments)?
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
  $ChallengeUserCommentSectionModalContentStateCopyWith<
          ChallengeUserCommentSectionModalContentState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeUserCommentSectionModalContentStateCopyWith<$Res> {
  factory $ChallengeUserCommentSectionModalContentStateCopyWith(
          ChallengeUserCommentSectionModalContentState value,
          $Res Function(ChallengeUserCommentSectionModalContentState) then) =
      _$ChallengeUserCommentSectionModalContentStateCopyWithImpl<$Res,
          ChallengeUserCommentSectionModalContentState>;
  @useResult
  $Res call({String? challengeId, List<ChallengeComment>? comments});
}

/// @nodoc
class _$ChallengeUserCommentSectionModalContentStateCopyWithImpl<$Res,
        $Val extends ChallengeUserCommentSectionModalContentState>
    implements $ChallengeUserCommentSectionModalContentStateCopyWith<$Res> {
  _$ChallengeUserCommentSectionModalContentStateCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ChallengeComment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ChallengeUserCommentSectionModalContentStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? challengeId, List<ChallengeComment>? comments});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChallengeUserCommentSectionModalContentStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$InitialImpl(
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ChallengeComment>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.challengeId, final List<ChallengeComment>? comments})
      : _comments = comments;

  @override
  final String? challengeId;
  final List<ChallengeComment>? _comments;
  @override
  List<ChallengeComment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChallengeUserCommentSectionModalContentState.initial(challengeId: $challengeId, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, challengeId, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? challengeId, List<ChallengeComment>? comments)
        initial,
  }) {
    return initial(challengeId, comments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? challengeId, List<ChallengeComment>? comments)?
        initial,
  }) {
    return initial?.call(challengeId, comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? challengeId, List<ChallengeComment>? comments)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(challengeId, comments);
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

abstract class _Initial
    implements ChallengeUserCommentSectionModalContentState {
  const factory _Initial(
      {final String? challengeId,
      final List<ChallengeComment>? comments}) = _$InitialImpl;

  @override
  String? get challengeId;
  @override
  List<ChallengeComment>? get comments;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
