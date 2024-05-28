import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_screen_state.dart';
part 'notifications_screen_cubit.freezed.dart';

class NotificationsScreenCubit extends Cubit<NotificationsScreenState> {
  NotificationsScreenCubit() : super(const NotificationsScreenState.initial());
}
