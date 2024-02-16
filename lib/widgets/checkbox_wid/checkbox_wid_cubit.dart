import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkbox_wid_state.dart';
part 'checkbox_wid_cubit.freezed.dart';

class CheckboxWidCubit extends Cubit<CheckboxWidState> {
  CheckboxWidCubit() : super(const CheckboxWidState.initial());
}
