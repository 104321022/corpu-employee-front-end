import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return const Scaffold(
            body: Center(
              child: Icon(
                Icons.supervised_user_circle_outlined,
              ),
              // child: SvgPicture.asset(
              //   Res.drawable.appLogo,
              // ),
            ),
          );
        },
      ),
    );
  }
}
