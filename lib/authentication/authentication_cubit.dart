import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/blocs/base_cubit.dart';

import '../core/logger/log.dart';
import '../core/models/common/boolean_status.dart';

part 'authentication_cubit.freezed.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends BaseCubit<AuthenticationState> {
  AuthenticationCubit({required super.context})
      : super(initialState: AuthenticationState.initial()) {
    // getUserAuthTokenFromSharedPreferences();
  }

  // Future<UserAuthToken?> getUserAuthTokenFromSharedPreferences() async {
  //   UserAuthToken? userAuthToken =
  //       await AuthenticationUtils.getUserAuthTokenFromSharedPreferences();
  //   if (userAuthToken != null) {
  //     emit(state.copyWith(
  //         userAccount: userAuthToken.userAccount,
  //         userAuthToken: userAuthToken,
  //         authenticationStatus: BooleanStatus.success));
  //   } else {
  //     emit(state.copyWith(authenticationStatus: BooleanStatus.error));
  //   }
  //   return Future.value(userAuthToken);
  // }
  //
  // Future<bool> saveUserAuthToken(UserAuthToken userAuthToken) async {
  //   emit(state.copyWith(
  //       userAuthToken: userAuthToken,
  //       userAccount: userAuthToken.userAccount,
  //       authenticationStatus: BooleanStatus.success));
  //   return Future.value(true);
  // }
  //
  // Future<bool> saveUserAccount(UserCredential userCredential) async {
  //   logger.d('in save user account');
  //   emitState(state.copyWith(
  //       authenticationStatus: BooleanStatus.success,
  //       userAccount: await convertUserCredentialToUserAccount(userCredential)));
  //   logger.d(state.authenticationStatus);
  //   logger.d(state.userAccount);
  //   return Future.value(true);
  // }
  //
  // Future<UserAccount?> convertUserCredentialToUserAccount(
  //     UserCredential userCredential) async {
  //   try {
  //     DocumentSnapshot userDocSnapshot = await FirebaseFirestore.instance
  //         .collection('user_accounts')
  //         .doc(userCredential.user!.uid)
  //         .get();
  //
  //     if (userDocSnapshot.exists) {
  //       return UserAccount.fromFirestore(
  //           userDocSnapshot.data() as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //     return null;
  //   }
  // }
}
