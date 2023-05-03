import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
    this.context,
  ) : super(const SignUpState()) {
    signUpForm = AuthForms.signUpForm;
    // _userApi = UserApi();
    _authService = AuthService();
  }

  final BuildContext context;
  late final FormGroup signUpForm;
  // late final UserApi _userApi;
  late final AuthService _authService;

  void back() {
    Navigator.pop(context);
  }
}
