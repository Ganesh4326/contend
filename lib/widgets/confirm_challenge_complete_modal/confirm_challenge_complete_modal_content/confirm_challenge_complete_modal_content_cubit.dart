import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/blocs/base_cubit.dart';
import '../../../services/fire_store.dart';

part 'confirm_challenge_complete_modal_content_cubit.freezed.dart';

part 'confirm_challenge_complete_modal_content_state.dart';

class ConfirmChallengeCompleteModalContentCubit
    extends BaseCubit<ConfirmChallengeCompleteModalContentState> {
  ConfirmChallengeCompleteModalContentCubit(
      {required super.context, String? userId, String? challengeId})
      : super(
            initialState: ConfirmChallengeCompleteModalContentState.initial(
                userId: userId, challengeId: challengeId));

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    emitState(state.copyWith(image: File(pickedFile!.path)));
  }

  addToAcceptedChallenges(int noOfDaysLeft) {
    FireStoreService().addToAcceptedChallenge(
        state.userId!, state.challengeId!, noOfDaysLeft);
  }

  addToLikedChallenges() {
    FireStoreService().addToLikedChallenges(state.userId!, state.challengeId!);
  }

  removeFromLikedChallenges() {
    FireStoreService()
        .removeChallengeFromLikedChallenges(state.userId!, state.challengeId);
  }

  deleteChallenge() {
    FireStoreService().deleteChallenge(state.challengeId!);
  }

  updateNoOfPeopleInChallenge() {
    FireStoreService().updateChallengeNoOfPeople(state.challengeId!);
  }
}
