// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_order_payment_modal_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmOrderPaymentModalState {
  BooleanStatus? get modalStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BooleanStatus? modalStatus) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BooleanStatus? modalStatus)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BooleanStatus? modalStatus)? initial,
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
  $ConfirmOrderPaymentModalStateCopyWith<ConfirmOrderPaymentModalState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmOrderPaymentModalStateCopyWith<$Res> {
  factory $ConfirmOrderPaymentModalStateCopyWith(
          ConfirmOrderPaymentModalState value,
          $Res Function(ConfirmOrderPaymentModalState) then) =
      _$ConfirmOrderPaymentModalStateCopyWithImpl<$Res,
          ConfirmOrderPaymentModalState>;
  @useResult
  $Res call({BooleanStatus? modalStatus});
}

/// @nodoc
class _$ConfirmOrderPaymentModalStateCopyWithImpl<$Res,
        $Val extends ConfirmOrderPaymentModalState>
    implements $ConfirmOrderPaymentModalStateCopyWith<$Res> {
  _$ConfirmOrderPaymentModalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalStatus = freezed,
  }) {
    return _then(_value.copyWith(
      modalStatus: freezed == modalStatus
          ? _value.modalStatus
          : modalStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ConfirmOrderPaymentModalStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BooleanStatus? modalStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ConfirmOrderPaymentModalStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalStatus = freezed,
  }) {
    return _then(_$InitialImpl(
      modalStatus: freezed == modalStatus
          ? _value.modalStatus
          : modalStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.modalStatus});

  @override
  final BooleanStatus? modalStatus;

  @override
  String toString() {
    return 'ConfirmOrderPaymentModalState.initial(modalStatus: $modalStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.modalStatus, modalStatus) ||
                other.modalStatus == modalStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, modalStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BooleanStatus? modalStatus) initial,
  }) {
    return initial(modalStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BooleanStatus? modalStatus)? initial,
  }) {
    return initial?.call(modalStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BooleanStatus? modalStatus)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(modalStatus);
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

abstract class _Initial implements ConfirmOrderPaymentModalState {
  const factory _Initial({final BooleanStatus? modalStatus}) = _$InitialImpl;

  @override
  BooleanStatus? get modalStatus;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
