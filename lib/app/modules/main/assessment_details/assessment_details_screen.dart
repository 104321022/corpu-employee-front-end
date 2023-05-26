import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart' as forms;

import '../../../../resources/resources.dart';
import '../../../app.dart';

class AssessmentDetailsScreen extends StatelessWidget {
  const AssessmentDetailsScreen({
    super.key,
    this.assessmentData,
  });

  final Map<String, dynamic>? assessmentData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssessmentDetailsCubit(
        context,
        assessmentData: assessmentData,
      ),
      child: BlocConsumer<AssessmentDetailsCubit, AssessmentDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<AssessmentDetailsCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Assessment Details'),
            ),
            body: Stack(
              children: [
                if (assessmentData != null)
                  forms.ReactiveForm(
                    formGroup: cubit.assessmentDetailsForm,
                    child: ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        Text(
                          assessmentData!['course_title'] ?? 'Course',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Course Code: ${assessmentData!['course_code']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Res.colors.materialColor,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        if (assessmentData!['details'] != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Due date: ${assessmentData!['details']['due_date']}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                'Questionares',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Res.colors.materialColor,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                'Please provide brief answer to these questions.',
                              ),
                              const SizedBox(height: 8.0),
                              ...(assessmentData!['details'] as Map)
                                  .entries
                                  .map(
                                (item) {
                                  if (item.key
                                          .toString()
                                          .startsWith('question') &&
                                      item.value != null) {
                                    var answerControlName =
                                        '${AssessmentDetailsForms.detailsControl}.answer${item.key.toString().characters.last}';
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        Text(
                                          '${item.key}'.camelCaseString(),
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          '${item.value}',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        ReactiveTextField(
                                          formControlName: answerControlName,
                                          keyboardType: TextInputType.text,
                                          inputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(),
                                            hintText: 'Type your answer...',
                                          ),
                                          validationMessages: {
                                            forms.ValidationMessage.required:
                                                (_) => Res
                                                    .string.thisFieldIsRequired,
                                          },
                                        ),
                                        const SizedBox(height: 8.0),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ).toList(),
                            ],
                          )
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
              child: state.userType == 'Employee'
                  ? ElevatedButton(
                      onPressed: state.loading ? null : cubit.submitAssessment,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 48.0),
                      ),
                      child: const Text('Submit'),
                    )
                  : state.userType == 'Staff'
                      ? ElevatedButton(
                          onPressed:
                              state.loading ? null : cubit.deleteAssessment,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.maxFinite, 48.0),
                          ),
                          child: const Text('Delete Assessment'),
                        )
                      : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
