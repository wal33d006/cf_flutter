import 'package:cf_flutter/domain/models/photo.dart';
import 'package:cf_flutter/features/photo_list/photo_list_initial_params.dart';

class PhotoListState {
  const PhotoListState({required this.isLoading, required this.photos});

  factory PhotoListState.initial(PhotoListInitialParams initialParams) =>
      const PhotoListState(isLoading: false, photos: []);

  final bool isLoading;
  final List<Photo> photos;

  PhotoListState copyWith({bool? isLoading, List<Photo>? photos}) => PhotoListState(
        isLoading: isLoading ?? this.isLoading,
        photos: photos ?? this.photos,
      );
}
