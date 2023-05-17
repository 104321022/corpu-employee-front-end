import 'package:corpuemployee/app/app.dart';
import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';

class StaffEmployeesPage extends StatelessWidget {
  const StaffEmployeesPage({
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
    );
  }
}
