import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class StaffDashboardScreen extends StatelessWidget {
  const StaffDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StaffDashboardCubit>(
          create: (context) => StaffDashboardCubit(context),
        ),
      ],
      child: BlocBuilder<StaffDashboardCubit, StaffDashboardState>(
        builder: (context, state) {
          var cubit = context.read<StaffDashboardCubit>();

          var pages = [
            StaffCoursesPage(cubit: cubit, state: state),
            // StaffEmployeesPage(cubit: cubit, state: state),
            StaffAssessmentPage(cubit: cubit, state: state),
            StaffProfilePage(cubit: cubit, state: state),
          ];

          return Scaffold(
            body: pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: cubit.onItemSelected,
              currentIndex: state.selectedIndex,
              items: [
                BottomNavigationBarItem(
                  label: Res.string.courses,
                  icon: Icon(
                    Icons.shelves,
                    color: Res.colors.darkGreyColor,
                  ),
                  activeIcon: Icon(
                    Icons.shelves,
                    color: Res.colors.materialColor,
                  ),
                  tooltip: Res.string.courses,
                ),
                // BottomNavigationBarItem(
                //   label: Res.string.employee,
                //   icon: Icon(
                //     Icons.group,
                //     color: Res.colors.darkGreyColor,
                //   ),
                //   activeIcon: Icon(
                //     Icons.group,
                //     color: Res.colors.materialColor,
                //   ),
                //   tooltip: Res.string.employee,
                // ),
                BottomNavigationBarItem(
                  label: Res.string.myAssessments,
                  icon: Icon(
                    Icons.assessment_outlined,
                    color: Res.colors.darkGreyColor,
                  ),
                  activeIcon: Icon(
                    Icons.assessment_outlined,
                    color: Res.colors.materialColor,
                  ),
                  tooltip: Res.string.myAssessments,
                ),
                BottomNavigationBarItem(
                  label: Res.string.profile,
                  icon: Icon(
                    Icons.person,
                    color: Res.colors.darkGreyColor,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: Res.colors.materialColor,
                  ),
                  tooltip: Res.string.profile,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
