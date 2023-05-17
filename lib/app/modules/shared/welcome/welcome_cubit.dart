import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit(this.context) : super(const WelcomeState()) {
    // init();
  }

  final BuildContext context;

  void staffLogin() {
    Navigator.pushNamed(
      context,
      Routes.signin,
      arguments: 'staff',
    );
  }

  void employeeLogin() {
    Navigator.pushNamed(
      context,
      Routes.signin,
      arguments: 'employee',
    );
  }
}
