import 'package:cf_flutter/data/models/photo_json.dart';
import 'package:cf_flutter/domain/failures/get_photos_failure.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestApiNasaRepository implements NasaRepository {
  Dio dio = Dio();

  @override
  Future<Either<GetPhotosFailure, List<Photo>>> getPhotos() async {
    try {
      final response = await dio.get(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY',
      );
      final data = response.data as Map<String, dynamic>;
      return right((data['photos'] as List).map((e) => PhotoJson.fromJson(e).toDomain()).toList());
    } catch (ex) {
      return left(GetPhotosFailure());
    }
  }
}
