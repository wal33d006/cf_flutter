import 'package:cf_flutter/features/onboarding/onboarding_initial_params.dart';

class OnboardingState {
  const OnboardingState({required this.isLoading});

  factory OnboardingState.initial(OnboardingInitialParams initialParams) => const OnboardingState(isLoading: false);

  final bool isLoading;

  OnboardingState copyWith({bool? isLoading}) => OnboardingState(
        isLoading: isLoading ?? this.isLoading,
      );
}
