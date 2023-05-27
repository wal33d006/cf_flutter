import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';

class PhotoDetailsPresentationModel {
  const PhotoDetailsPresentationModel({required this.photo});

  factory PhotoDetailsPresentationModel.initial(PhotoDetailsInitialParams initialParams) =>
      PhotoDetailsPresentationModel(
        photo: initialParams.photo,
      );

  final Photo photo;

  PhotoDetailsPresentationModel copyWith({Photo? photo}) => PhotoDetailsPresentationModel(
        photo: photo ?? this.photo,
      );
}
