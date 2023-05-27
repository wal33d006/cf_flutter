import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';

class PhotoDetailsState {
  const PhotoDetailsState({required this.photo});

  factory PhotoDetailsState.initial(PhotoDetailsInitialParams initialParams) => PhotoDetailsState(photo: Photo.empty());

  final Photo photo;

  PhotoDetailsState copyWith({Photo? photo}) => PhotoDetailsState(
        photo: photo ?? this.photo,
      );
}
