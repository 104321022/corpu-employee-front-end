// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(const SplashState()) {
    _getStorage = GetStorage();

    init();
  }

  final BuildContext context;
  late GetStorage _getStorage;

  init() async {
    await Future.delayed(const Duration(seconds: 2));

    var userId = _getStorage.read('user_id');
    if (userId == null || userId.toString().isEmpty) {
      Navigator.pushReplacementNamed(
        context,
        Routes.welcome,
      );
    } else {
      var userType = _getStorage.read('user_type');
      if (userType.toString().toLowerCase() == 'staff') {
        Navigator.pushReplacementNamed(
          context,
          Routes.staffDashboard,
        );
      } else if (userType.toString().toLowerCase() == 'employee') {
        Navigator.pushReplacementNamed(
          context,
          Routes.employeeDashboard,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          Routes.welcome,
        );
      }
    }
  }
}
