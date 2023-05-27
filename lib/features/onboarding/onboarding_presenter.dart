import 'package:cf_flutter/domain/respositories/auth_repository.dart';
import 'package:cf_flutter/features/onboarding/onboarding_initial_params.dart';
import 'package:cf_flutter/features/onboarding/onboarding_navigator.dart';
import 'package:cf_flutter/features/onboarding/onboarding_presentation_model.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPresenter extends Cubit<OnboardingPresentationModel> {
  final OnboardingInitialParams initialParams;
  final OnboardingNavigator navigator;
  final AuthRepository _authRepository;

  OnboardingPresenter(
    this.initialParams,
    this.navigator,
    this._authRepository,
  ) : super(OnboardingPresentationModel.initial(initialParams));

  Future<void> onInit() async {
    emit(state.copyWith(isLoading: true));
    _authRepository.signInAnonymously().then(
          (value) => value.fold(
            (l) => navigator.showError(l.friendlyErrorString),
            (r) => navigator.openPhotoList(const PhotoListInitialParams()),
          ),
        );
  }
}
