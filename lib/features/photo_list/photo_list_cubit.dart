import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListCubit extends Cubit<PhotoListState> {
  final NasaRepository _nasaRepository;
  final PhotoListInitialParams initialParams;
  final PhotoListNavigator navigator;

  PhotoListCubit(
    this.initialParams,
    this._nasaRepository,
    this.navigator,
  ) : super(PhotoListState.initial(initialParams));

  onInit() {
    emit(state.copyWith(isLoading: true));
    _nasaRepository.getPhotos().then(
          (value) => value.fold(
            (l) => navigator.showError(l.friendlyErrorString),
            (r) => emit(
              state.copyWith(
                photos: r,
                isLoading: false,
              ),
            ),
          ),
        );
  }

  onPhotoTapped(Photo photo) => navigator.openPhotoDetails(PhotoDetailsInitialParams(photo: photo));
}
