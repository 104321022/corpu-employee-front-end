import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = Get.mediaQuery.size.width / 2;

    return BlocProvider(
      create: (context) => WelcomeCubit(context),
      child: BlocBuilder<WelcomeCubit, WelcomeState>(
        builder: (context, state) {
          var cubit = context.read<WelcomeCubit>();

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      Res.string.welcome,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'CorpU University\nHiring New Employees',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      Res.string.continueas,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: cubit.staffLogin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          buttonWidth,
                          48.0,
                        ),
                      ),
                      child: Text(
                        Res.string.staff,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: cubit.employeeLogin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          buttonWidth,
                          48.0,
                        ),
                      ),
                      child: Text(
                        Res.string.applicant,
                      ),
                    ),
                  ],
                ).marginAll(48.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
