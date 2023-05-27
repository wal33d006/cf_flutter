import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';

class PhotoListPresentationModel {
  const PhotoListPresentationModel({
    required this.isLoading,
    required this.photos,
    required this.isDarkTheme,
  });

  factory PhotoListPresentationModel.initial(PhotoListInitialParams initialParams) => const PhotoListPresentationModel(
        isLoading: false,
        photos: [],
        isDarkTheme: false,
      );

  final bool isLoading;
  final List<Photo> photos;
  final bool isDarkTheme;

  PhotoListPresentationModel copyWith({
    bool? isLoading,
    List<Photo>? photos,
    bool? isDarkTheme,
  }) =>
      PhotoListPresentationModel(
        isLoading: isLoading ?? this.isLoading,
        photos: photos ?? this.photos,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );
}
