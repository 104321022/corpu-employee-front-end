import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart' as forms;

import '../../../../resources/resources.dart';
import '../../../app.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
    this.userType,
  });

  final String? userType;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = Get.mediaQuery.size.width;

    return BlocProvider(
      create: (context) => SignUpCubit(
        context,
        userType: userType,
      ),
      child: Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listenWhen: (prev, curr) => prev.authStatus != curr.authStatus,
          listener: (context, state) {
            switch (state.authStatus) {
              case AuthStatus.success:
                Helpers.successSnackBar(
                  context: context,
                  title: state.authMessage,
                );
                break;
              case AuthStatus.failed:
                Helpers.errorSnackBar(
                  context: context,
                  title: state.authMessage,
                );
                break;
              default:
            }
          },
          builder: (context, state) {
            var signUpCubit = context.read<SignUpCubit>();

            return AbsorbPointer(
              absorbing: state.status == SignUpStatus.signUpLoading,
              child: GestureDetector(
                onTap: signUpCubit.signUpForm.unfocus,
                child: SafeArea(
                  child: forms.ReactiveForm(
                    formGroup: signUpCubit.signUpForm,
                    child: Column(
                      children: [
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: const ScrollBehavior().copyWith(
                              overscroll: false,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const SizedBox(height: 24),
                                  Text(
                                    'CorpU\nUniversity',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 48.0,
                                      color: Res.colors.materialColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 48),
                                  Text(
                                    Res.string.signUp,
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 48),
                                  ReactiveTextField(
                                    formControlName: AuthForms.firstNameControl,
                                    keyboardType: TextInputType.name,
                                    inputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(),
                                      hintText: Res.string.firstName,
                                      labelText: Res.string.firstName,
                                    ),
                                    validationMessages: {
                                      forms.ValidationMessage.required: (_) =>
                                          Res.string.thisFieldIsRequired,
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  ReactiveTextField(
                                    formControlName: AuthForms.lastNameControl,
                                    keyboardType: TextInputType.name,
                                    inputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(),
                                      hintText: Res.string.lastName,
                                      labelText: Res.string.lastName,
                                    ),
                                    validationMessages: {
                                      forms.ValidationMessage.required: (_) =>
                                          Res.string.thisFieldIsRequired,
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  ReactiveTextField(
                                    formControlName: AuthForms.emailControl,
                                    keyboardType: TextInputType.emailAddress,
                                    inputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(),
                                      hintText: Res.string.email,
                                      labelText: Res.string.email,
                                    ),
                                    validationMessages: {
                                      forms.ValidationMessage.required: (_) =>
                                          Res.string.thisFieldIsRequired,
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  ReactiveTextField(
                                    formControlName: AuthForms.contactNoControl,
                                    keyboardType: TextInputType.number,
                                    inputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(),
                                      hintText: Res.string.contactNo,
                                      labelText: Res.string.contactNo,
                                    ),
                                    validationMessages: {
                                      forms.ValidationMessage.required: (_) =>
                                          Res.string.thisFieldIsRequired,
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  ReactiveTextField(
                                    formControlName: AuthForms.passwordControl,
                                    keyboardType: TextInputType.visiblePassword,
                                    inputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(),
                                      hintText: Res.string.password,
                                      labelText: Res.string.password,
                                    ),
                                    validationMessages: {
                                      forms.ValidationMessage.required: (_) =>
                                          Res.string.thisFieldIsRequired,
                                    },
                                  ),
                                  const SizedBox(height: 48.0),
                                  ElevatedButton(
                                    onPressed: state.status ==
                                            SignUpStatus.signUpLoading
                                        ? null
                                        : signUpCubit.signup,
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                        buttonWidth,
                                        48.0,
                                      ),
                                    ),
                                    child: state.status ==
                                            SignUpStatus.signUpLoading
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Res.colors.materialColor,
                                            ),
                                          )
                                        : Text(
                                            Res.string.signUp,
                                          ),
                                  ),
                                ],
                              ).paddingSymmetric(
                                vertical: 16,
                                horizontal: 24,
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: Res.string.alreadyhaveanaccount,
                                style: TextStyle(
                                  color: Res.colors.darkGreyColor,
                                ),
                              ),
                              const WidgetSpan(child: SizedBox(width: 8)),
                              TextSpan(
                                text: Res.string.signIn,
                                style: TextStyle(
                                  color: Res.colors.materialColor,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = signUpCubit.back,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
