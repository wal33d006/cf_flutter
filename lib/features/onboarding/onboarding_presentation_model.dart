import 'package:cf_flutter/features/onboarding/onboarding_initial_params.dart';

class OnboardingPresentationModel {
  const OnboardingPresentationModel({required this.isLoading});

  factory OnboardingPresentationModel.initial(OnboardingInitialParams initialParams) =>
      const OnboardingPresentationModel(isLoading: false);

  final bool isLoading;

  OnboardingPresentationModel copyWith({bool? isLoading}) => OnboardingPresentationModel(
        isLoading: isLoading ?? this.isLoading,
      );
}
