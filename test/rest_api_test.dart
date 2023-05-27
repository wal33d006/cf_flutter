import 'package:cf_flutter/data/repostories/rest_api_nasa_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late MockDioClient client;
  late RestApiNasaRepository repository;
  late MockEnvRepository envRepository;

  test(
    'On init should populate photos in the state',
    () async {
      when(() => client.get(any())).thenAnswer((_) => Future.value(right(Mocks.partialPhotoJson)));
      when(() => envRepository.getEnvironmentVariableByKey(any())).thenReturn('DEMO_KEY');

      repository.getPhotos().then(
            (value) => value.fold(
              (_) => null,
              (r) => expect(r.length, 1),
            ),
          );
    },
  );

  setUp(() {
    client = MockDioClient();
    envRepository = MockEnvRepository();
    repository = RestApiNasaRepository(client, envRepository);
  });
}
