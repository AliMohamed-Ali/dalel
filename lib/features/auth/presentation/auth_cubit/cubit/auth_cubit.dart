import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? firstName, lastName, emailAddress, password;
  bool termsAndCondition = false;
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> logInKey = GlobalKey();
  bool isShowPassword = false;
  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errorMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errorMessage: "The account already exists for that email."));
      } else {
        emit(SignUpFailureState(errorMessage: e.toString()));
      }
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  loginWithEmailAddressAndPassword() async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      FirebaseAuth.instance.currentUser!.emailVerified
          ? emit(LoginSuccessState())
          : emit(
              LoginFailureState(errorMessage: "Check your email for verify"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(LoginFailureState(errorMessage: "auth credential is incorrect"));
      }
    } catch (e) {
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }

  updateTermsAndCondition({required bool newValue}) {
    termsAndCondition = newValue;
    emit(TermsAndConditionUpdate());
  }

  showPassoword() {
    isShowPassword = !isShowPassword;
    emit(ShowPasswordState());
  }
}
