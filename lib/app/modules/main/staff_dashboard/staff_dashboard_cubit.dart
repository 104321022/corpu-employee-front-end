// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../configs/configs.dart';
import '../../../../resources/resources.dart';
import '../../../app.dart';

part 'staff_dashboard_state.dart';

class StaffDashboardCubit extends Cubit<StaffDashboardState> {
  StaffDashboardCubit(
    this.context,
  ) : super(const StaffDashboardState()) {
    scaffoldKey = GlobalKey<ScaffoldState>();
    _getStorage = GetStorage();
    _dio = Dio();

    _getUserDetails();
    _getCourses();
    _getAssessments();
  }

  final BuildContext context;
  // FindServicemanCubit? findServicemanCubit;
  // BookingsCubit? bookingsCubit;
  // ProfileCubit? profileCubit;
  late final GlobalKey<ScaffoldState> scaffoldKey;
  late GetStorage _getStorage;
  late Dio _dio;

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

  void _getUserDetails() {
    var firstName = _getStorage.read('first_name');
    var lastName = _getStorage.read('last_name');
    var email = _getStorage.read('email');
    var phone = _getStorage.read('contact_no');

    emit(
      state.copyWith(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      ),
    );
  }

  Future<void> _getCourses() async {
    try {
      emit(
        state.copyWith(
          coursesLoading: true,
        ),
      );

      var response = await _dio.get(
        '${HTTPConfig.baseURL}courses',
      );
      if (response.statusCode == 200) {
        // success
        List? courses = response.data?['courses'];
        if (courses != null && courses.isNotEmpty) {
          emit(
            state.copyWith(
              courses: courses,
            ),
          );
        } else {
          emit(
            state.copyWith(
              courses: [],
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            courses: [],
          ),
        );
        Helpers.errorSnackBar(
          context: context,
          title: 'Something went wrong',
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          courses: [],
        ),
      );
      Helpers.errorSnackBar(
        context: context,
        title: Res.string.somethingWentWrong,
      );
    } finally {
      emit(
        state.copyWith(
          coursesLoading: false,
        ),
      );
    }
  }

  Future<void> _getAssessments() async {
    try {
      emit(
        state.copyWith(
          assessmentsLoading: true,
        ),
      );

      var userId = _getStorage.read('user_id');
      var userType = _getStorage.read('user_type');

      var response = await _dio.get(
        '${HTTPConfig.baseURL}getAssessments/',
        data: {
          'user_id': userId,
          'user_type': userType.toString().toLowerCase(),
        },
      );
      if (response.statusCode == 200) {
        // success
        List? assessments = response.data?['assessments'];
        if (assessments != null && assessments.isNotEmpty) {
          emit(
            state.copyWith(
              assessments: assessments,
            ),
          );
        } else {
          emit(
            state.copyWith(
              assessments: [],
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            assessments: [],
          ),
        );
        Helpers.errorSnackBar(
          context: context,
          title: 'Something went wrong',
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          assessments: [],
        ),
      );
      Helpers.errorSnackBar(
        context: context,
        title: Res.string.somethingWentWrong,
      );
    } finally {
      emit(
        state.copyWith(
          assessmentsLoading: false,
        ),
      );
    }
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
          await _getStorage.erase();

          // Navigate to Login
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
