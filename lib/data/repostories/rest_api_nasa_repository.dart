import 'package:cf_flutter/data/models/photo_json.dart';
import 'package:cf_flutter/data/network/dio_client.dart';
import 'package:cf_flutter/data/repostories/env_repository.dart';
import 'package:cf_flutter/domain/failures/get_photos_failure.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:dartz/dartz.dart';

class RestApiNasaRepository implements NasaRepository {
  final DioClient _client;
  final EnvRepository _envRepository;

  RestApiNasaRepository(this._client, this._envRepository);

  @override
  Future<Either<GetPhotosFailure, List<Photo>>> getPhotos() => _client
      .get(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=${_envRepository.getEnvironmentVariableByKey('API_KEY')}',
      )
      .then(
        (value) => value.fold(
          (fail) => left(GetPhotosFailure(friendlyErrorString: fail.error)),
          (data) => right((data['photos'] as List).map((e) => PhotoJson.fromJson(e).toDomain()).toList()),
        ),
      );
}
