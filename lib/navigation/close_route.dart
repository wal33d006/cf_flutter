import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:flutter/cupertino.dart';

mixin CloseRoute {
  AppNavigator get appNavigator;

  BuildContext get context;

  void close() => appNavigator.close(context);
}
