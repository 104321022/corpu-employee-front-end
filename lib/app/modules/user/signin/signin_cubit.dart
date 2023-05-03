import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../db/db.dart' as db;
import '../../../app.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this.context, {
    this.userType,
  }) : super(const SignInState()) {
    signInForm = AuthForms.signInForm;
    // _userApi = UserApi();
    _userStorage = db.UserStorage();
  }

  final BuildContext context;
  final String? userType;
  late final FormGroup signInForm;
  // late final UserApi _userApi;
  late final db.UserStorage _userStorage;

  void signup() {
    Navigator.pushNamed(
      context,
      Routes.signup,
      arguments: userType,
    );
  }

  Future<void> signIn() async {
    if (signInForm.valid) {
      if (userType.toString().toLowerCase() == 'staff') {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.staffDashboard,
          (route) => false,
        );
      } else {}
    } else {
      signInForm.markAllAsTouched();
    }
  }
}
