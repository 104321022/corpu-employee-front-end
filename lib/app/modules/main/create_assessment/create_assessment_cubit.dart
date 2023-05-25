// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:corpuemployee/app/modules/main/create_assessment/create_assessment_form.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../configs/configs.dart';
import '../../../app.dart';

part 'create_assessment_state.dart';

class CreateAssessmentCubit extends Cubit<CreateAssessmentState> {
  CreateAssessmentCubit(
    this.context,
  ) : super(const CreateAssessmentState()) {
    _dio = Dio();
    _getStorage = GetStorage();
    createAssessmentForm = CreateAssessmentForm.createAssessmentForm;

    var userId = _getStorage.read('user_id');
    createAssessmentForm.patchValue(
      {
        CreateAssessmentForm.staffId: '$userId',
      },
    );

    getCoursesForAssessment();
  }

  final BuildContext context;
  late Dio _dio;
  late final FormGroup createAssessmentForm;
  late GetStorage _getStorage;

  Future<void> getCoursesForAssessment() async {
    try {
      emit(
        state.copyWith(
          loading: true,
        ),
      );
      var response = await _dio.get(
        '${HTTPConfig.baseURL}courses',
      );
      if (response.statusCode == 200) {
        List? courses = response.data?['courses'];
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
    } catch (e) {
      emit(
        state.copyWith(
          courses: [],
        ),
      );
      Helpers.errorSnackBar(
        context: context,
        title: 'Something went wrong',
      );
    } finally {
      emit(
        state.copyWith(
          loading: false,
        ),
      );
    }
  }

  Future<void> getApplicantsForCourse(String courseCode) async {
    try {
      emit(
        state.copyWith(
          loading: true,
        ),
      );
      var response = await _dio.get(
        '${HTTPConfig.baseURL}getApplicationsForCourse',
        data: {
          'course_code': courseCode,
        },
      );
      if (response.statusCode == 200) {
        List? applicants = response.data?['applications'];
        emit(
          state.copyWith(
            applicants: applicants,
          ),
        );
      } else {
        emit(
          state.copyWith(
            applicants: [],
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          applicants: [],
        ),
      );
      Helpers.errorSnackBar(
        context: context,
        title: 'Something went wrong',
      );
    } finally {
      emit(
        state.copyWith(
          loading: false,
        ),
      );
    }
  }

  Future<void> createAssessment() async {
    if (createAssessmentForm.valid) {
      try {
        emit(
          state.copyWith(
            loading: true,
          ),
        );

        var response = await _dio.post(
          '${HTTPConfig.baseURL}createAssessment/',
          data: createAssessmentForm.value,
        );

        if (response.statusCode == 200) {
          Helpers.successSnackBar(
            context: context,
            title: 'Assessment created successfully',
          );
          Navigator.pop(context, true);
        } else {
          Helpers.errorSnackBar(
            context: context,
            title: 'Something went wrong',
          );
        }
      } catch (e) {
        Helpers.errorSnackBar(
          context: context,
          title: 'Something went wrong',
        );
      } finally {
        emit(
          state.copyWith(
            loading: false,
          ),
        );
      }
    } else {
      createAssessmentForm.markAllAsTouched();
    }
  }
}
