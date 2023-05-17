import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class EmployeeCoursesPage extends StatelessWidget {
  const EmployeeCoursesPage({
    super.key,
    required this.cubit,
    required this.state,
  });

  final EmployeeDashboardCubit cubit;
  final EmployeeDashboardState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Res.string.courses),
        centerTitle: true,
      ),
      body: state.courses == null || state.coursesLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Res.colors.materialColor,
              ),
            )
          : state.courses!.isEmpty
              ? Center(
                  child: Text(
                    Res.string.noDataFound,
                  ),
                )
              : ListView.separated(
                  itemCount: state.courses!.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8.0);
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    var course = state.courses![index];

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
                          course['course_title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          course['course_code'],
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
