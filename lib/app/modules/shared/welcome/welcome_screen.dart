import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(context),
      child: BlocBuilder<WelcomeCubit, WelcomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    Res.string.welcome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    Res.string.continueas,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      Res.string.staff,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      Res.string.employee,
                    ),
                  ),
                ],
              ).marginSymmetric(
                horizontal: 48.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
