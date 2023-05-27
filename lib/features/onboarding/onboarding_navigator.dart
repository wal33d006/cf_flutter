import 'package:cf_flutter/features/onboarding/onboarding_initial_params.dart';
import 'package:cf_flutter/features/onboarding/onboarding_page.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:cf_flutter/main.dart';
import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:cf_flutter/navigation/error_dialog_route.dart';
import 'package:flutter/cupertino.dart';

class OnboardingNavigator with ErrorDialogRoute, PhotoListRoute {
  OnboardingNavigator(this.appNavigator);

  @override
  late AppNavigator appNavigator;

  @override
  late BuildContext context;
}

mixin OnboardingRoute {
  openOnboarding() {
    appNavigator.push(
      context,
      OnboardingPage(
        presenter: getIt(param1: const OnboardingInitialParams()),
      ),
    );
  }

  AppNavigator get appNavigator;

  BuildContext get context;
}
