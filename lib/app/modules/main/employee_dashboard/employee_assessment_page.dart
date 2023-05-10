import 'package:corpuemployee/app/app.dart';
import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';

class EmployeeAssessmentPage extends StatelessWidget {
  const EmployeeAssessmentPage({
    super.key,
    required this.dashboardCubit,
  });

  final EmployeeDashboardCubit dashboardCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Res.string.myAssessments),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8.0);
        },
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        itemBuilder: (context, index) {
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
                'Assessment $index',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'assessment${index}id',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Res.colors.materialColor,
                ),
              ),
              trailing: Text('0${index + 4}/05/23'),
            ),
          );
        },
      ),
    );
  }
}
