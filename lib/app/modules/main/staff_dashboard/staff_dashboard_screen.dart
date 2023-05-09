import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart' as forms;

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
          var dashboardCubit = context.read<StaffDashboardCubit>();

          var pages = [
            StaffCoursesPage(dashboardCubit: dashboardCubit),
            StaffAssessmentPage(dashboardCubit: dashboardCubit),
            StaffProfilePage(dashboardCubit: dashboardCubit),
          ];

          return Scaffold(
            body: pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: dashboardCubit.onItemSelected,
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
