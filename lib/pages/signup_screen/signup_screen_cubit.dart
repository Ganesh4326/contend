import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_screen_state.dart';
part 'signup_screen_cubit.freezed.dart';

class SignupScreenCubit extends Cubit<SignupScreenState> {
  SignupScreenCubit() : super(const SignupScreenState.initial());
}
