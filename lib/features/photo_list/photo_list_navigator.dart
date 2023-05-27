import 'package:cf_flutter/features/photo_details/photo_details_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_page.dart';
import 'package:cf_flutter/main.dart';
import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:cf_flutter/navigation/error_dialog_route.dart';
import 'package:flutter/material.dart';

class PhotoListNavigator with PhotoDetailsRoute, ErrorDialogRoute {
  PhotoListNavigator(this.appNavigator);

  @override
  late AppNavigator appNavigator;

  @override
  late BuildContext context;
}

mixin PhotoListRoute {
  openPhotoList(PhotoListInitialParams initialParams) {
    appNavigator.pushReplacement(context, PhotoListPage(presenter: getIt(param1: initialParams)));
  }

  AppNavigator get appNavigator;

  BuildContext get context;
}
