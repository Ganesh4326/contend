import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_screen_state.dart';
part 'help_screen_cubit.freezed.dart';

class HelpScreenCubit extends Cubit<HelpScreenState> {
  HelpScreenCubit() : super(const HelpScreenState.initial());
}
