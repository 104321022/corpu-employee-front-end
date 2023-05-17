import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart' as forms;

import '../../../../resources/resources.dart';
import '../../../app.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
    this.userType,
  });

  final String? userType;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = Get.mediaQuery.size.width;

    return BlocProvider(
      create: (context) => SignInCubit(
        context,
        userType: userType,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<SignInCubit, SignInState>(
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
            var signInCubit = context.read<SignInCubit>();

            return AbsorbPointer(
              absorbing: state.status == SignInStatus.signInLoading,
              child: GestureDetector(
                onTap: signInCubit.signInForm.unfocus,
                child: SafeArea(
                  child: forms.ReactiveForm(
                    formGroup: signInCubit.signInForm,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 24),
                          const CircleAvatar(
                            radius: 40.0,
                          ),
                          const SizedBox(height: 48),
                          Text(
                            Res.string.signIn,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 48),
                          ReactiveTextField(
                            formControlName: AuthForms.emailControl,
                            hint: Res.string.email,
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
                            formControlName: AuthForms.passwordControl,
                            hint: Res.string.password,
                            keyboardType: TextInputType.visiblePassword,
                            inputAction: TextInputAction.go,
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
                            obscureText: true,
                          ).paddingOnly(
                            bottom: 16,
                          ),
                          const SizedBox(height: 48.0),
                          ElevatedButton(
                            onPressed:
                                state.status == SignInStatus.signInLoading
                                    ? null
                                    : signInCubit.signIn,
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                buttonWidth,
                                48.0,
                              ),
                            ),
                            child: state.status == SignInStatus.signInLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Res.colors.materialColor,
                                    ),
                                  )
                                : Text(
                                    Res.string.signIn,
                                  ),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: Res.string.dontHaveAnAccount,
                                  style: TextStyle(
                                    color: Res.colors.darkGreyColor,
                                  ),
                                ),
                                const WidgetSpan(child: SizedBox(width: 8)),
                                TextSpan(
                                  text: Res.string.signUp,
                                  style: TextStyle(
                                    color: Res.colors.materialColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = signInCubit.signup,
                                ),
                              ],
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
              ),
            );
          },
        ),
      ),
    );
  }
}
