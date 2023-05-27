import 'package:cf_flutter/domain/failures/get_photos_failure.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:dartz/dartz.dart';

abstract class NasaRepository {
  Future<Either<GetPhotosFailure, List<Photo>>> getPhotos();
}
