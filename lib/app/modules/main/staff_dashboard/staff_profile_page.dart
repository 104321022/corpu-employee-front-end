import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart' as forms;

import '../../../../resources/resources.dart';
import '../../../app.dart';

class StaffProfilePage extends StatelessWidget {
  const StaffProfilePage({
    super.key,
    required this.cubit,
    required this.state,
  });

  final StaffDashboardCubit cubit;
  final StaffDashboardState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Res.string.profile),
        actions: [
          TextButton(
            onPressed: cubit.editMode,
            child: Text(
              state.editMode ? Res.string.cancel : Res.string.edit,
              style: TextStyle(
                color: Res.colors.whiteColor,
              ),
            ),
          )
        ],
      ),
      body: state.profileLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Res.colors.materialColor,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: forms.ReactiveForm(
                    formGroup: cubit.staffProfileForm,
                    child: ListView(
                      padding: const EdgeInsets.all(20.0),
                      children: [
                        // const CircleAvatar(
                        //   radius: 60.0,
                        // ),
                        // const SizedBox(height: 48.0),
                        Text(Res.string.firstName),
                        const SizedBox(height: 8.0),
                        ReactiveTextField(
                          formControlName: StaffForms.firstNameControl,
                          keyboardType: TextInputType.name,
                          inputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: 'First Name',
                          ),
                          validationMessages: {
                            forms.ValidationMessage.required: (_) =>
                                Res.string.thisFieldIsRequired,
                            forms.ValidationMessage.pattern: (_) =>
                                'Enter a valid First Name',
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(Res.string.lastName),
                        const SizedBox(height: 8.0),
                        ReactiveTextField(
                          formControlName: StaffForms.lastNameControl,
                          keyboardType: TextInputType.name,
                          inputAction: TextInputAction.next,
                          readOnly: !state.editMode,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: 'Last Name',
                          ),
                          validationMessages: {
                            forms.ValidationMessage.required: (_) =>
                                Res.string.thisFieldIsRequired,
                            forms.ValidationMessage.pattern: (_) =>
                                'Enter a valid Last Name',
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(Res.string.email),
                        const SizedBox(height: 8.0),
                        ReactiveTextField(
                          formControlName: StaffForms.emailControl,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          // readOnly: !state.editMode,
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: 'Email Address',
                          ),
                          validationMessages: {
                            forms.ValidationMessage.required: (_) =>
                                Res.string.thisFieldIsRequired,
                            forms.ValidationMessage.email: (_) =>
                                'Enter a valid Email Address',
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(Res.string.contactNo),
                        const SizedBox(height: 8.0),
                        ReactiveTextField(
                          formControlName: StaffForms.contactControl,
                          keyboardType: TextInputType.phone,
                          inputAction: TextInputAction.next,
                          readOnly: !state.editMode,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                            hintText: '0xxxxxxxxx',
                          ),
                          validationMessages: {
                            forms.ValidationMessage.required: (_) =>
                                Res.string.thisFieldIsRequired,
                            forms.ValidationMessage.number: (_) =>
                                'Enter a valid Phone Number',
                            forms.ValidationMessage.minLength: (_) =>
                                'Enter a valid 10 digit Phone Number',
                            forms.ValidationMessage.maxLength: (_) =>
                                'Enter a valid 10 digit Phone Number',
                          },
                        ),
                        ...(cubit.staffProfileForm
                                    .control(StaffForms.detailsControl)
                                as forms.FormGroup)
                            .controls
                            .entries
                            .map(
                          (control) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16.0),
                                Text(
                                  control.key.camelCaseString(),
                                ),
                                const SizedBox(height: 8.0),
                                ReactiveTextField(
                                  formControlName:
                                      '${StaffForms.detailsControl}.${control.key}',
                                  keyboardType: TextInputType.text,
                                  inputAction: TextInputAction.next,
                                  readOnly: !state.editMode,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(),
                                    hintText: 'Enter details',
                                  ),
                                  validationMessages: {
                                    forms.ValidationMessage.required: (_) =>
                                        Res.string.thisFieldIsRequired,
                                  },
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: state.editMode,
                  child: ElevatedButton(
                    onPressed: cubit.updateProfile,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.maxFinite,
                        48.0,
                      ),
                      backgroundColor: Res.colors.materialColor,
                    ),
                    child: const Text(
                      'Update Profile',
                    ),
                  ).marginAll(16.0),
                ),
                Visibility(
                  visible: !state.editMode,
                  child: ElevatedButton(
                    onPressed: cubit.logout,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.maxFinite,
                        48.0,
                      ),
                      backgroundColor: Res.colors.chestnutRedColor,
                    ),
                    child: Text(
                      Res.string.logout,
                    ),
                  ).marginAll(16.0),
                ),
              ],
            ),
    );
  }
}
