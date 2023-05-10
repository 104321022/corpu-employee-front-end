import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../db/db.dart';
import '../../../../resources/resources.dart';
import '../../../app.dart';

part 'employee_dashboard_state.dart';

class EmployeeDashboardCubit extends Cubit<EmployeeDashboardState> {
  EmployeeDashboardCubit(
    this.context,
  ) : super(const EmployeeDashboardState()) {
    scaffoldKey = GlobalKey<ScaffoldState>();
    _userStorage = UserStorage();
  }

  final BuildContext context;
  // FindServicemanCubit? findServicemanCubit;
  // BookingsCubit? bookingsCubit;
  // ProfileCubit? profileCubit;
  late final GlobalKey<ScaffoldState> scaffoldKey;
  late UserStorage _userStorage;
  // late DashboardApi _dashboardApi;

  void onItemSelected(int index) {
    emit(
      state.copyWith(
        selectedIndex: index,
        // currentPageTitle: index == 1
        //     ? Res.string.bookings
        //     : index == 2
        //         ? Res.string.profile
        //         : Res.string.home,
      ),
    );
  }

  void _logoutAlert({
    Function()? logoutCallback,
  }) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            Res.string.appTitle.toUpperCase(),
            style: TextStyle(
              color: Res.colors.materialColor,
            ),
          ),
          content: Text(
            Res.string.logoutMessage,
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: logoutCallback,
              child: Text(
                Res.string.logout,
                style: TextStyle(
                  color: Res.colors.redColor,
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                Res.string.cancel,
                style: TextStyle(
                  color: Res.colors.materialColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> logout() async {
    _logoutAlert(
      logoutCallback: () async {
        try {
          // Navigate to Login
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.welcome,
            (route) => false,
          );
        } catch (e) {
          debugPrint('$e');
          Helpers.errorSnackBar(
            context: context,
            title: Res.string.errorLoggingOut,
          );
        }
      },
    );
  }
}
