// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../configs/configs.dart';
import '../../../app.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this.context, {
    this.userType,
  }) : super(const SignInState()) {
    signInForm = AuthForms.signInForm;
    _dio = Dio();
    _getStorage = GetStorage();
  }

  final BuildContext context;
  final String? userType;
  late final FormGroup signInForm;
  late Dio _dio;
  late GetStorage _getStorage;

  void signup() {
    Navigator.pushNamed(
      context,
      Routes.signup,
      arguments: userType,
    );
  }

  Future<void> signIn() async {
    if (signInForm.valid) {
      try {
        emit(
          state.copyWith(
            status: SignInStatus.signInLoading,
          ),
        );
        var response = await _dio.post(
          '${HTTPConfig.baseURL}signin/',
          data: signInForm.value,
        );

        if (response.statusCode == 200) {
          // success
          await _getStorage.write(
            'user_id',
            response.data['user_id'],
          );
          await _getStorage.write(
            'first_name',
            response.data['first_name'],
          );
          await _getStorage.write(
            'last_name',
            response.data['last_name'],
          );
          await _getStorage.write(
            'email',
            response.data['email'],
          );
          await _getStorage.write(
            'contact_no',
            response.data['contact_no'],
          );
          await _getStorage.write(
            'user_type',
            response.data['user_type'],
          );
          await _getStorage.write(
            'user_details',
            response.data['details'],
          );

          Helpers.successSnackBar(
            context: context,
            title: 'Signin successful',
          );

          var responseUserType =
              response.data['user_type'].toString().toLowerCase();
          if (responseUserType == 'staff') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.staffDashboard,
              (route) => false,
            );
          } else if (responseUserType == 'employee') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.employeeDashboard,
              (route) => false,
            );
          }
        } else {
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
            status: SignInStatus.loaded,
            authStatus: AuthStatus.none,
          ),
        );
      }
    } else {
      signInForm.markAllAsTouched();
    }
  }
}
