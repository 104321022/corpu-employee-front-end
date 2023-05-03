// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../db/db.dart';
import '../../../app.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(const SplashState()) {
    _userStorage = UserStorage();

    init();
  }

  final BuildContext context;
  late UserStorage _userStorage;

  // navigateToLogin() {
  //   // Navigator.pushReplacementNamed(context, Routes.signIn);
  //   Navigator.pushReplacementNamed(context, Routes.completeProfile);
  // }

  // navigateToDashboard() {
  //   Navigator.pushReplacementNamed(context, Routes.dashboard);
  // }

  init() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(
      context,
      Routes.welcome,
      // Routes.staffDashboard,
    );

    //   var userId = _userStorage.getUserId();
    //   var userData = _userStorage.getUserData();
    //   await Future.delayed(const Duration(seconds: 2));

    //   if (userId != null && userData != null) {
    //     navigateToDashboard();
    //   } else {
    //     navigateToLogin();
    //   }
  }
}
