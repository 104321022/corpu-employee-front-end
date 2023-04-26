import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../db/db.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit(this.context) : super(const WelcomeState()) {
    _userStorage = UserStorage();

    // init();
  }

  final BuildContext context;
  late UserStorage _userStorage;
}
