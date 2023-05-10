import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class EmployeeCoursesPage extends StatelessWidget {
  const EmployeeCoursesPage({
    super.key,
    required this.dashboardCubit,
  });

  final EmployeeDashboardCubit dashboardCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Res.string.courses),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 15,
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
                'Course $index',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'course${index}code',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Res.colors.materialColor,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
