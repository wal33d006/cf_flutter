import 'package:cf_flutter/data/repostories/rest_api_nasa_repository.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:cf_flutter/features/photo_details/photo_details_cubit.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_details/photo_details_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_cubit.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_page.dart';
import 'package:cf_flutter/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<NasaRepository>(() => RestApiNasaRepository());
  getIt.registerFactory<AppNavigator>(AppNavigator.new);
  getIt.registerLazySingleton<PhotoListNavigator>(() => PhotoListNavigator(getIt()));
  getIt.registerLazySingleton<PhotoDetailsNavigator>(() => PhotoDetailsNavigator(getIt()));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PhotoListCubit>(
        create: (BuildContext context) => PhotoListCubit(const PhotoListInitialParams(), getIt(), getIt()),
      ),
      BlocProvider<PhotoDetailsCubit>(
        create: (BuildContext context) => PhotoDetailsCubit(PhotoDetailsInitialParams.empty(), getIt()),
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
      home: const PhotoListPage(),
    );
  }
}
