import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class StaffProfilePage extends StatelessWidget {
  const StaffProfilePage({
    super.key,
    required this.dashboardCubit,
  });

  final StaffDashboardCubit dashboardCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
