import 'package:cf_flutter/data/network/dio_client.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/auth_repository.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:cf_flutter/features/onboarding/onboarding_navigator.dart';
import 'package:cf_flutter/features/photo_list/photo_list_navigator.dart';
import 'package:mocktail/mocktail.dart';

class Mocks {
  static List<Photo> photos = [
    Photo.empty().copyWith(id: 123),
    Photo.empty().copyWith(id: 345),
    Photo.empty().copyWith(id: 543),
    Photo.empty().copyWith(id: 1234),
  ];

  static Map<String, dynamic> partialPhotoJson = {
    "photos": [
      {"id": 123}
    ]
  };
}

class MockPhotoListNavigator extends Mock implements PhotoListNavigator {}

class MockOnboardingNavigator extends Mock implements OnboardingNavigator {}

class MockNasaRepository extends Mock implements NasaRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockDioClient extends Mock implements DioClient {}
