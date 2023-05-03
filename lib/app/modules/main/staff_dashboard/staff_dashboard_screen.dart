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
            Scaffold(
              appBar: AppBar(
                title: Text(Res.string.courses),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
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
            ),
            Center(child: Text(Res.string.myAssessments)),
            Scaffold(
              appBar: AppBar(
                title: Text(Res.string.profile),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      Res.string.edit,
                      style: TextStyle(
                        color: Res.colors.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(20.0),
                      children: [
                        const CircleAvatar(
                          radius: 60.0,
                        ),
                        const SizedBox(height: 48.0),
                        Text(Res.string.firstName),
                        const SizedBox(height: 8.0),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Res.colors.darkGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('John'),
                        ),
                        const SizedBox(height: 16.0),
                        Text(Res.string.lastName),
                        const SizedBox(height: 8.0),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Res.colors.darkGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('Doe'),
                        ),
                        const SizedBox(height: 16.0),
                        Text(Res.string.email),
                        const SizedBox(height: 8.0),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Res.colors.darkGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('test_user@swin.edu.au'),
                        ),
                        const SizedBox(height: 16.0),
                        Text(Res.string.contactNo),
                        const SizedBox(height: 8.0),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Res.colors.darkGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('0123456789'),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: dashboardCubit.logout,
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
                ],
              ),
            ),
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
