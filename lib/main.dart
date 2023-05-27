import 'package:cf_flutter/data/network/dio_client.dart';
import 'package:cf_flutter/data/repostories/firebase_auth_repository.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerFactory<DioClient>(DioClient.new);
  getIt.registerLazySingleton<NasaRepository>(() => RestApiNasaRepository(getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
  getIt.registerFactory<AppNavigator>(AppNavigator.new);
  getIt.registerLazySingleton<PhotoListNavigator>(() => PhotoListNavigator(getIt()));
  getIt.registerLazySingleton<PhotoDetailsNavigator>(() => PhotoDetailsNavigator(getIt()));
  getIt.registerLazySingleton<OnboardingNavigator>(() => OnboardingNavigator(getIt()));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PhotoListPresenter>(
        create: (BuildContext context) => PhotoListPresenter(const PhotoListInitialParams(), getIt(), getIt()),
      ),
      BlocProvider<PhotoDetailsPresenter>(
        create: (BuildContext context) => PhotoDetailsPresenter(PhotoDetailsInitialParams.empty(), getIt()),
      ),
      BlocProvider<OnboardingPresenter>(
        create: (BuildContext context) => OnboardingPresenter(
          const OnboardingInitialParams(),
          getIt(),
          getIt(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
