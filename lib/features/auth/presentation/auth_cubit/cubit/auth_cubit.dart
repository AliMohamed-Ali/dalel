import 'package:cloud_firestore/cloud_firestore.dart';
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
  GlobalKey<FormState> forgotPasswordKey = GlobalKey();
  bool isShowPassword = false;
  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
     await verifyEmail();
     await addUserInfo();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleExption(e);
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  void _signUpHandleExption(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignUpFailureState(
          errorMessage: "The password provided is too weak."));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errorMessage: "The account already exists for that email."));
    } else {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> loginWithEmailAddressAndPassword() async {
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

  void updateTermsAndCondition({required bool newValue}) {
    termsAndCondition = newValue;
    emit(TermsAndConditionUpdate());
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> addUserInfo() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress
    });
  }

  showPassoword() {
    isShowPassword = !isShowPassword;
    emit(ShowPasswordState());
  }
}
