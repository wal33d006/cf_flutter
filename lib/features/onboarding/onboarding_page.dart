import 'package:cf_flutter/domain/utils/date_formatter.dart';
import 'package:cf_flutter/features/onboarding/onboarding_cubit.dart';
import 'package:cf_flutter/features/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<OnboardingCubit>(context);
    cubit.navigator.context = context;
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        bloc: cubit,
        builder: (context, state) {
          return Center(
            child: state.isLoading ? const CircularProgressIndicator() : Container(),
          );
        },
      ),
    );
  }
}
