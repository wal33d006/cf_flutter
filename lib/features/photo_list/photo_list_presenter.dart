import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_presentation_model.dart';
import 'package:cf_flutter/theme/theme_store.dart';
import 'package:cf_flutter/theme/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListPresenter extends Cubit<PhotoListPresentationModel> {
  final NasaRepository _nasaRepository;
  final PhotoListInitialParams initialParams;
  final PhotoListNavigator navigator;
  final ThemeStore _themeStore;

  PhotoListPresenter(
    this.initialParams,
    this._nasaRepository,
    this.navigator,
    this._themeStore,
  ) : super(PhotoListPresentationModel.initial(initialParams));

  Future<void> onInit() async {
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

  void onThemeToggled(bool value) {
    _themeStore.setTheme(value ? darkTheme : lightTheme);
    emit(state.copyWith(isDarkTheme: value));
  }
}
