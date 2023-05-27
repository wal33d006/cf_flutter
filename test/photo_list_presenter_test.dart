import 'package:cf_flutter/domain/failures/get_photos_failure.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_presenter.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late PhotoListPresenter presenter;
  late PhotoListNavigator navigator;
  late MockNasaRepository mockNasaRepository;

  test(
    'On init should populate photos in the state',
    () async {
      when(() => mockNasaRepository.getPhotos()).thenAnswer((_) => Future.value(right(Mocks.photos)));

      await presenter.onInit();

      expect(presenter.state.photos.length, Mocks.photos.length);

      verify(() => mockNasaRepository.getPhotos());
    },
  );

  test(
    'On error from photo list api should show error dialog',
    () async {
      when(() => mockNasaRepository.getPhotos()).thenAnswer((_) => Future.value(left(const GetPhotosFailure())));
      when(() => navigator.showError(any())).thenAnswer((_) => Future.value());

      await presenter.onInit();

      verify(() => navigator.showError(any()));
    },
  );

  test(
    'On photo tapped should should open photo details page',
    () async {
      when(() => navigator.openPhotoDetails(any())).thenAnswer((_) => Future.value());

      await presenter.onPhotoTapped(Photo.empty());

      verify(() => navigator.openPhotoDetails(any()));
    },
  );

  setUp(() {
    registerFallbackValue(PhotoDetailsInitialParams(photo: Photo.empty()));
    mockNasaRepository = MockNasaRepository();
    navigator = MockPhotoListNavigator();
    presenter = PhotoListPresenter(
      const PhotoListInitialParams(),
      mockNasaRepository,
      navigator,
    );
  });
}
