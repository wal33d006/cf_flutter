import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';

class PhotoListPresentationModel {
  const PhotoListPresentationModel({required this.isLoading, required this.photos});

  factory PhotoListPresentationModel.initial(PhotoListInitialParams initialParams) =>
      const PhotoListPresentationModel(isLoading: false, photos: []);

  final bool isLoading;
  final List<Photo> photos;

  PhotoListPresentationModel copyWith({bool? isLoading, List<Photo>? photos}) => PhotoListPresentationModel(
        isLoading: isLoading ?? this.isLoading,
        photos: photos ?? this.photos,
      );
}
