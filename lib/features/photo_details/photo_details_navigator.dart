import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_details/photo_details_page.dart';
import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:flutter/cupertino.dart';

class PhotoDetailsNavigator {
  PhotoDetailsNavigator(this.appNavigator);

  late AppNavigator appNavigator;

  late BuildContext context;
}

mixin PhotoDetailsRoute {
  openPhotoDetails(PhotoDetailsInitialParams initialParams) {
    appNavigator.push(context, PhotoDetailsPage(initialParams: initialParams));
  }

  AppNavigator get appNavigator;

  BuildContext get context;
}
