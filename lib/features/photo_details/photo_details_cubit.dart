import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_details/photo_details_navigator.dart';
import 'package:cf_flutter/features/photo_details/photo_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoDetailsCubit extends Cubit<PhotoDetailsState> {
  final PhotoDetailsInitialParams initialParams;
  final PhotoDetailsNavigator navigator;

  PhotoDetailsCubit(this.initialParams, this.navigator) : super(PhotoDetailsState.initial(initialParams));

  void onInit(PhotoDetailsInitialParams initialParams) => emit(state.copyWith(photo: initialParams.photo));
}
