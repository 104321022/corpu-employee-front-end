import 'package:flutter/material.dart';

import '../app.dart';

enum _PageTransitionType {
  fade,
  rightToLeft,
  bottomToTop,
  rightToLeftFaded,
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initial:
        return _PageTransition(
          child: const SplashScreen(),
        );
      case Routes.welcome:
        return _PageTransition(
          child: const WelcomeScreen(),
        );
      case Routes.signin:
        args as String?;
        return _PageTransition(
          child: SignInScreen(
            userType: args,
          ),
        );
      case Routes.signup:
        args as String?;
        return _PageTransition(
          child: SignUpScreen(
            userType: args,
          ),
        );
      case Routes.staffDashboard:
        return _PageTransition(
          child: const StaffDashboardScreen(),
        );
      case Routes.employeeDashboard:
        return _PageTransition(
          child: const EmployeeDashboardScreen(),
        );
      // case Routes.forgotPassword:
      //   return _PageTransition(
      //     child: const ForgotPasswordScreen(),
      //   );
      // case Routes.otp:
      //   args as Map?;
      //   return _PageTransition(
      //     child: OtpScreen(
      //       data: args,
      //     ),
      //   );
      // case Routes.dashboard:
      //   return _PageTransition(
      //     child: const DashboardScreen(),
      //   );
      // case Routes.review:
      //   args as Map;
      //   return _PageTransition(
      //     child: ReviewScreen(
      //       data: args,
      //     ),
      //   );
      // case Routes.locationMap:
      //   return _PageTransition(
      //     child: const LocationMapScreen(),
      //   );
      // case Routes.placesSearch:
      //   return _PageTransition(
      //     child: const PlacesSearchScreen(),
      //   );
      // case Routes.support:
      //   args as Map;
      //   return _PageTransition(
      //     child: SupportScreen(
      //       data: args,
      //     ),
      //   );
      // case Routes.help:
      //   return _PageTransition(
      //     child: const HelpScreen(),
      //   );
      // case Routes.changePassword:
      //   return _PageTransition(
      //     child: const ChangePasswordScreen(),
      //   );
      // case Routes.completeProfile:
      //   return _PageTransition(
      //     child: const CompleteProfileScreen(),
      //   );
      // case Routes.profession:
      //   return _PageTransition(
      //     child: const ProfessionScreen(),
      //   );
      // case Routes.workPhotos:
      //   return _PageTransition(
      //     child: const WorkPhotosScreen(),
      //   );
      // case Routes.documents:
      //   return _PageTransition(
      //     child: const DocumentsScreen(),
      //   );
      // case Routes.updatePrice:
      //   return _PageTransition(
      //     child: const UpdatePriceScreen(),
      //   );
      // case Routes.updateProfile:
      //   return _PageTransition(
      //     child: const UpdateProfileScreen(),
      //   );
      // case Routes.settings:
      //   return _PageTransition(
      //     child: const SettingsScreen(),
      //   );
      // case Routes.subscription:
      //   return _PageTransition(
      //     child: const SubscriptionScreen(),
      //   );
      // case Routes.tracking:
      //   return _PageTransition(
      //     child: const TrackingScreen(),
      //   );
      // case Routes.chat:
      //   return _PageTransition(
      //     child: const ChatScreen(),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class _PageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Curve curve;
  final Duration duration;
  final Duration reverseDuration;
  final _PageTransitionType type;

  _PageTransition({
    required this.child,
    this.type = _PageTransitionType.rightToLeftFaded,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    RouteSettings? settings,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          settings: settings,
          maintainState: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            switch (type) {
              case _PageTransitionType.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              case _PageTransitionType.rightToLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case _PageTransitionType.rightToLeftFaded:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
              case _PageTransitionType.bottomToTop:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              default:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
            }
          },
        );
}
