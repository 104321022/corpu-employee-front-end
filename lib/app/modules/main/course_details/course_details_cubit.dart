// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../configs/configs.dart';
import '../../../../resources/resources.dart';
import '../../../app.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(
    this.context, {
    this.courseData,
  }) : super(const CourseDetailsState()) {
    _dio = Dio();
    _getStorage = GetStorage();

    _getUserDetails();
  }

  final BuildContext context;
  final Map? courseData;
  late Dio _dio;
  late GetStorage _getStorage;

  void _getUserDetails() {
    var userType = _getStorage.read('user_type');

    emit(
      state.copyWith(
        userType: userType,
      ),
    );
  }

  Future<void> apply() async {
    var apply = await DialogUtil.showDialogWithYesNoButton(
      context,
      message:
          'Do you want to apply for ${courseData?['course_title']}(${courseData?['course_code']})',
      noBtnText: Res.string.cancel,
      yesBtnCallback: () {
        Navigator.pop(context, true);
      },
    );

    if (apply == true) {
      try {
        emit(
          state.copyWith(
            loading: true,
          ),
        );

        var userId = _getStorage.read('user_id');
        var response = await _dio.post(
          '${HTTPConfig.baseURL}postJobApplication',
          data: {
            'applicant_id': userId,
            'course_code': '${courseData?['course_code']}',
            'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
            'status': 'New',
          },
        );
        if (response.statusCode == 200) {
          Helpers.successSnackBar(
            context: context,
            title: 'Application Submitted Successfully',
          );
          Navigator.pop(context, true);
        } else {
          Helpers.errorSnackBar(
            context: context,
            title: response.data['message'] ?? Res.string.somethingWentWrong,
          );
        }
      } on DioError catch (e) {
        Helpers.errorSnackBar(
          context: context,
          title: e.response?.data?['message'] ?? Res.string.somethingWentWrong,
        );
      } catch (e) {
        Helpers.errorSnackBar(
          context: context,
          title: Res.string.somethingWentWrong,
        );
      } finally {
        emit(
          state.copyWith(
            loading: false,
          ),
        );
      }
    }
  }

  Future<void> editDetails() async {}
}
