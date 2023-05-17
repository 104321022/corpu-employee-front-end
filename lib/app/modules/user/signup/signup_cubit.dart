// ignore_for_file: use_build_context_synchronously

import 'package:corpuemployee/configs/configs.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
    this.context, {
    this.userType,
  }) : super(const SignUpState()) {
    signUpForm = AuthForms.signUpForm;
    _dio = Dio();
    _getStorage = GetStorage();
  }

  final BuildContext context;
  final String? userType;
  late final FormGroup signUpForm;
  late Dio _dio;
  late GetStorage _getStorage;

  void back() {
    Navigator.pop(context);
  }

  Future<void> signup() async {
    signUpForm.patchValue({
      AuthForms.userTypeControl: userType,
    });
    if (signUpForm.valid) {
      try {
        emit(
          state.copyWith(
            status: SignUpStatus.signUpLoading,
          ),
        );
        var response = await _dio.post(
          '${HTTPConfig.baseURL}signup/',
          data: signUpForm.value,
        );
        if (response.statusCode == 200) {
          DialogUtil.showDialogWithOKButton(
            context,
            message: 'Account created successfully. Proceed to Login!',
            barrierDismissible: false,
            callback: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.signin,
                (route) => false,
              );
            },
          );
        } else {
          // error from API
          Helpers.errorSnackBar(
            context: context,
            title: 'Something went wrong',
          );
        }
      } catch (e) {
        Helpers.errorSnackBar(
          context: context,
          title: 'Something went wrong',
        );
      } finally {
        emit(
          state.copyWith(
            status: SignUpStatus.loaded,
          ),
        );
      }
    } else {
      signUpForm.markAllAsTouched();
    }
  }
}
