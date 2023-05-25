import 'package:corpuemployee/app/app.dart';
import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';

class StaffAssessmentPage extends StatelessWidget {
  const StaffAssessmentPage({
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
        title: Text(Res.string.myAssessments),
        centerTitle: true,
      ),
      body: state.assessments == null || state.assessmentsLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Res.colors.materialColor,
              ),
            )
          : state.assessments!.isEmpty
              ? Center(
                  child: Text(
                    Res.string.noDataFound,
                  ),
                )
              : ListView.separated(
                  itemCount: state.assessments!.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8.0);
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    var assessment = state.assessments![index];

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Res.colors.darkGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Res.colors.darkGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        title: Text(
                          'Applicant: ${assessment['employee_name']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'Approver: ${assessment['staff_name']}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Res.colors.materialColor,
                          ),
                        ),
                        trailing: Text(
                          assessment['details']?['due_date'] ?? '',
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.createAssessment,
          );
        },
        tooltip: 'Create Assessment',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
