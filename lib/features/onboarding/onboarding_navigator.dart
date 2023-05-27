import 'package:cf_flutter/features/onboarding/onboarding_page.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:cf_flutter/navigation/error_dialog_route.dart';
import 'package:flutter/cupertino.dart';

class OnboardingNavigator with ErrorDialogRoute, PhotoListRoute {
  OnboardingNavigator(this.appNavigator);

  late AppNavigator appNavigator;

  @override
  late BuildContext context;
}

mixin OnboardingRoute {
  openOnboarding() {
    appNavigator.push(context, const OnboardingPage());
  }

  AppNavigator get appNavigator;

  BuildContext get context;
}
