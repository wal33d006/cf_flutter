import 'package:cf_flutter/domain/failures/get_photos_failure.dart';
import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/domain/respositories/nasa_respository.dart';
import 'package:dartz/dartz.dart';

/// The API key had a limit so I didn't want to exhaust all tries with that. This class is not being used anywhere,
/// not even in the tests. Tests use Mocktail.

class MockNasaRepository implements NasaRepository {
  @override
  Future<Either<GetPhotosFailure, List<Photo>>> getPhotos() async {
    return right(
      [
        Photo.empty().copyWith(
          camera: Camera.empty().copyWith(name: 'FHAZ'),
          imgSrc:
              "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FRB_486265257EDR_F0481570FHAZ00323M_.JPG",
        ),
      ],
    );
  }
}
