import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_details/photo_details_navigator.dart';
import 'package:cf_flutter/features/photo_details/photo_details_presentation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoDetailsPresenter extends Cubit<PhotoDetailsPresentationModel> {
  final PhotoDetailsInitialParams initialParams;
  final PhotoDetailsNavigator navigator;

  PhotoDetailsPresenter(this.initialParams, this.navigator)
      : super(PhotoDetailsPresentationModel.initial(initialParams));
}
