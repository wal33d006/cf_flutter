import 'package:cf_flutter/domain/models/photo.dart';

class PhotoDetailsInitialParams {
  const PhotoDetailsInitialParams({required this.photo});

  factory PhotoDetailsInitialParams.empty() => PhotoDetailsInitialParams(photo: Photo.empty());

  final Photo photo;
}
