import 'package:cf_flutter/domain/failures/sign_in_failure.dart';
import 'package:cf_flutter/domain/models/user.dart';
import 'package:cf_flutter/features/onboarding/onboarding_initial_params.dart';
import 'package:cf_flutter/features/onboarding/onboarding_navigator.dart';
import 'package:cf_flutter/features/onboarding/onboarding_presenter.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late OnboardingPresenter presenter;
  late OnboardingNavigator navigator;
  late MockAuthRepository authRepository;

  test(
    'Successful sign in should navigate to photo list page',
    () async {
      when(() => authRepository.signInAnonymously()).thenAnswer((_) => Future.value(right(const User(uid: '12345'))));
      when(() => navigator.openPhotoList(any())).thenAnswer((_) => Future.value());

      await presenter.onInit();

      verify(() => navigator.openPhotoList(any()));
    },
  );

  test(
    'Unsuccessful sign in should show error dialog',
    () async {
      when(() => authRepository.signInAnonymously()).thenAnswer((_) => Future.value(left(const SignInFailure())));
      when(() => navigator.showError(any())).thenAnswer((_) => Future.value());

      await presenter.onInit();

      verify(() => navigator.showError(any()));
    },
  );

  setUp(() {
    registerFallbackValue(const PhotoListInitialParams());
    authRepository = MockAuthRepository();
    navigator = MockOnboardingNavigator();
    presenter = OnboardingPresenter(
      const OnboardingInitialParams(),
      navigator,
      authRepository,
    );
  });
}
