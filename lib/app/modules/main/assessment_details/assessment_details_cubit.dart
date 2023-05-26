// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../configs/configs.dart';
import '../../../../resources/resources.dart';
import '../../../app.dart';

part 'assessment_details_state.dart';

class AssessmentDetailsCubit extends Cubit<AssessmentDetailsState> {
  AssessmentDetailsCubit(
    this.context, {
    this.assessmentData,
  }) : super(const AssessmentDetailsState()) {
    _dio = Dio();
    _getStorage = GetStorage();
    assessmentDetailsForm = AssessmentDetailsForms.assessmentDetailsForm;

    assessmentData?['details']?['submit_date'] =
        DateFormat('dd-MM-yyyy').format(DateTime.now());
    assessmentData?['details']?['status'] = 'Submitted';
    assessmentDetailsForm.patchValue(assessmentData);

    _getUserDetails();
  }

  final BuildContext context;
  final Map<String, dynamic>? assessmentData;
  late Dio _dio;
  late GetStorage _getStorage;
  late final FormGroup assessmentDetailsForm;

  void _getUserDetails() {
    var userType = _getStorage.read('user_type');

    emit(
      state.copyWith(
        userType: userType,
      ),
    );
  }

  Future<void> submitAssessment() async {
    debugPrint('assessmentDetailsForm.value ${assessmentDetailsForm.value}');
    var accept = await DialogUtil.showDialogWithYesNoButton(
      context,
      message:
          'Do you want to submit the assessment for ${assessmentData?['course_title']}(${assessmentData?['course_code']})',
      noBtnText: Res.string.cancel,
      yesBtnCallback: () {
        Navigator.pop(context, true);
      },
    );

    if (accept == true) {
      try {
        emit(
          state.copyWith(
            loading: true,
          ),
        );

        var response = await _dio.post(
          '${HTTPConfig.baseURL}submitAssessment',
          data: assessmentDetailsForm.value,
        );
        if (response.statusCode == 200) {
          Helpers.successSnackBar(
            context: context,
            title: 'Assessment Submitted. Please wait for the staff to respond',
          );
          Navigator.pop(context, true);
        } else {
          Helpers.errorSnackBar(
            context: context,
            title: response.data?['message'] ?? Res.string.somethingWentWrong,
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

  Future<void> rejectAssessment() async {
    var delete = await DialogUtil.showDialogWithYesNoButton(
      context,
      message:
          'Do you want to reject the assessment of ${assessmentData?['employee_name']} for ${assessmentData?['course_title']}(${assessmentData?['course_code']})',
      noBtnText: Res.string.cancel,
      yesBtnCallback: () {
        Navigator.pop(context, true);
      },
    );

    if (delete == true) {
      try {
        emit(
          state.copyWith(
            loading: true,
          ),
        );

        var response = await _dio.post(
          '${HTTPConfig.baseURL}rejectAssessment',
          data: {
            'assessment_id': assessmentData?['assessment_id'],
          },
        );

        if (response.statusCode == 200) {
          Helpers.successSnackBar(
            context: context,
            title: 'Assessment rejected successfully.',
          );
          Navigator.pop(context, true);
        } else {
          Helpers.errorSnackBar(
            context: context,
            title: response.data?['message'] ?? Res.string.somethingWentWrong,
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

  Future<void> approveAssessment() async {
    var delete = await DialogUtil.showDialogWithYesNoButton(
      context,
      message:
          'Do you want to approve the assessment of ${assessmentData?['employee_name']} for ${assessmentData?['course_title']}(${assessmentData?['course_code']})',
      noBtnText: Res.string.cancel,
      yesBtnCallback: () {
        Navigator.pop(context, true);
      },
    );

    if (delete == true) {
      try {
        emit(
          state.copyWith(
            loading: true,
          ),
        );

        var response = await _dio.post(
          '${HTTPConfig.baseURL}approveAssessment',
          data: {
            'assessment_id': assessmentData?['assessment_id'],
          },
        );

        if (response.statusCode == 200) {
          Helpers.successSnackBar(
            context: context,
            title: 'Assessment approved successfully.',
          );
          Navigator.pop(context, true);
        } else {
          Helpers.errorSnackBar(
            context: context,
            title: response.data?['message'] ?? Res.string.somethingWentWrong,
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
}
