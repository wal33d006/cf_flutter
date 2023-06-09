import 'package:cf_flutter/data/network/dio_client.dart';
import 'package:cf_flutter/data/repostories/env_repository.dart';
import 'package:cf_flutter/data/repostories/firebase_auth_repository.dart';
import 'package:cf_flutter/data/repostories/mock_nasa_repository.dart';
import 'package:cf_flutter/data/repostories/rest_api_nasa_repository.dart';
import 'package:cf_flutter/domain/respositories/auth_repository.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:cf_flutter/features/onboarding/onboarding_presenter.dart';
import 'package:cf_flutter/features/onboarding/onboarding_initial_params.dart';
import 'package:cf_flutter/features/onboarding/onboarding_navigator.dart';
import 'package:cf_flutter/features/onboarding/onboarding_page.dart';
import 'package:cf_flutter/features/photo_details/photo_details_presenter.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_details/photo_details_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_presenter.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:cf_flutter/firebase_options.dart';
import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:cf_flutter/theme/theme_presentation_model.dart';
import 'package:cf_flutter/theme/theme_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  _registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeStore, ThemePresentationModel>(
      bloc: getIt<ThemeStore>(),
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CF Flutter',
          theme: state.theme,
          home: OnboardingPage(
            presenter: getIt(param1: const OnboardingInitialParams()),
          ),
        );
      },
    );
  }
}

void _registerDependencies() {
  getIt
    ..registerFactory<DioClient>(DioClient.new)
    ..registerFactory<EnvRepository>(EnvRepository.new)
    ..registerLazySingleton<NasaRepository>(() => RestApiNasaRepository(getIt(), getIt()))

    /// Only for testing purposes during development
    // ..registerLazySingleton<NasaRepository>(() => MockNasaRepository())
    ..registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository())
    ..registerFactory<AppNavigator>(AppNavigator.new)
    ..registerLazySingleton<PhotoListNavigator>(() => PhotoListNavigator(getIt()))
    ..registerLazySingleton<PhotoDetailsNavigator>(() => PhotoDetailsNavigator(getIt()))
    ..registerLazySingleton<OnboardingNavigator>(() => OnboardingNavigator(getIt()))
    ..registerLazySingleton<ThemeStore>(() => ThemeStore())
    ..registerFactoryParam<PhotoListPresenter, PhotoListInitialParams, dynamic>(
      (params, _) => PhotoListPresenter(
        params,
        getIt(),
        getIt(),
        getIt(),
      ),
    )
    ..registerFactoryParam<PhotoDetailsPresenter, PhotoDetailsInitialParams, dynamic>(
      (params, _) => PhotoDetailsPresenter(
        params,
        getIt(),
      ),
    )
    ..registerFactoryParam<OnboardingPresenter, OnboardingInitialParams, dynamic>(
      (params, _) => OnboardingPresenter(
        params,
        getIt(),
        getIt(),
      ),
    );
}
