import 'package:cf_flutter/data/models/photo_json.dart';
import 'package:cf_flutter/data/network/dio_client.dart';
import 'package:cf_flutter/domain/failures/get_photos_failure.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:dartz/dartz.dart';

class RestApiNasaRepository implements NasaRepository {
  final DioClient _client;

  RestApiNasaRepository(this._client);

  @override
  Future<Either<GetPhotosFailure, List<Photo>>> getPhotos() => _client
      .get(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=mzQVQpZD4UCTgVLzMZWlfF15LMIE3vucXvOr2Xig',
      )
      .then(
        (value) => value.fold(
          (fail) => left(GetPhotosFailure(friendlyErrorString: fail.error)),
          (data) => right((data['photos'] as List).map((e) => PhotoJson.fromJson(e).toDomain()).toList()),
        ),
      );
}
