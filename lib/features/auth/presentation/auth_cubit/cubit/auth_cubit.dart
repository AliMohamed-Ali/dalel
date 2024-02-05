import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? firstName, lastName, emailAddress, password;
  bool termsAndCondition = false;
  GlobalKey<FormState> signUpKey = GlobalKey();
  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errorMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errorMessage: "The account already exists for that email."));
      }
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  updateTermsAndCondition({required bool newValue}) {
    termsAndCondition = newValue;
    emit(TermsAndConditionUpdate());
  }
}
