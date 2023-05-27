import 'package:cf_flutter/features/onboarding/onboarding_presenter.dart';
import 'package:cf_flutter/features/onboarding/onboarding_presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingPresenter presenter;

  const OnboardingPage({required this.presenter, Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  OnboardingPresenter get presenter => widget.presenter;

  @override
  void initState() {
    super.initState();
    presenter.navigator.context = context;
    presenter.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<OnboardingPresenter, OnboardingPresentationModel>(
        bloc: presenter,
        builder: (context, state) {
          return Center(
            child: state.isLoading ? const CircularProgressIndicator() : Container(),
          );
        },
      ),
    );
  }
}
