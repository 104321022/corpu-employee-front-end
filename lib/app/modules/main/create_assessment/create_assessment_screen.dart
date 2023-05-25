import 'dart:convert';

import 'package:corpuemployee/app/modules/main/create_assessment/create_assessment_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart' as forms;

import '../../../../resources/resources.dart';
import '../../../app.dart';

class CreateAssessmentScreen extends StatelessWidget {
  const CreateAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAssessmentCubit(context),
      child: BlocConsumer<CreateAssessmentCubit, CreateAssessmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<CreateAssessmentCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Create Assessment'),
            ),
            body: Stack(
              children: [
                forms.ReactiveForm(
                  formGroup: cubit.createAssessmentForm,
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      const SizedBox(height: 24),
                      forms.ReactiveDropdownField(
                        formControlName: CreateAssessmentForm.courseCode,
                        hint: const Text('Course'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Course',
                          labelText: 'Course',
                        ),
                        isExpanded: true,
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                        items: state.courses
                            .map(
                              (e) => DropdownMenuItem(
                                value: '${e['course_code']}',
                                child: Text(
                                  '${e?['course_title']} (${e?['course_code']})',
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (control) {
                          cubit.getApplicantsForCourse(control.value!);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      forms.ReactiveDropdownField(
                        formControlName: CreateAssessmentForm.employeeId,
                        hint: const Text('Employee'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Employee',
                          labelText: 'Employee',
                        ),
                        isExpanded: true,
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                        items: state.applicants
                            .map(
                              (e) => DropdownMenuItem(
                                value: '${e['applicant_id']}',
                                child: Text(
                                  '${e['first_name']} ${e['last_name']} - ${e['date']}',
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName:
                            '${CreateAssessmentForm.details}.${CreateAssessmentForm.dueDate}',
                        hint: 'dd-MM-yyyy',
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9-]'),
                          ),
                        ],
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'dd-MM-yyyy',
                          labelText: 'Due date',
                        ),
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Questionares',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Type in up to 5 Questions (optional)',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName:
                            '${CreateAssessmentForm.details}.${CreateAssessmentForm.question1}',
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Type your question',
                          labelText: 'Question 1',
                        ),
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName:
                            '${CreateAssessmentForm.details}.${CreateAssessmentForm.question2}',
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Type your question',
                          labelText: 'Question 2',
                        ),
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName:
                            '${CreateAssessmentForm.details}.${CreateAssessmentForm.question3}',
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Type your question',
                          labelText: 'Question 3',
                        ),
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName:
                            '${CreateAssessmentForm.details}.${CreateAssessmentForm.question4}',
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Type your question',
                          labelText: 'Question 4',
                        ),
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName:
                            '${CreateAssessmentForm.details}.${CreateAssessmentForm.question5}',
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Type your question',
                          labelText: 'Question 5',
                        ),
                        validationMessages: {
                          forms.ValidationMessage.required: (_) =>
                              Res.string.thisFieldIsRequired,
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: state.loading,
                  child: const CupertinoAlertDialog(
                    title: CupertinoActivityIndicator(),
                    content: Text('Loading'),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: state.loading ? null : cubit.createAssessment,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 48.0),
                ),
                child: const Text('Create Assessment'),
              ),
            ),
          );
        },
      ),
    );
  }
}
