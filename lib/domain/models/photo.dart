import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final int sol;
  final Camera camera;
  final String imgSrc;
  final String earthDate;
  final Rover rover;

  const Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory Photo.empty() => Photo(
        id: 0,
        sol: 0,
        camera: Camera.empty(),
        imgSrc: '',
        earthDate: '',
        rover: Rover.empty(),
      );

  Photo copyWith({
    int? id,
    int? sol,
    Camera? camera,
    String? imgSrc,
    String? earthDate,
    Rover? rover,
  }) =>
      Photo(
        id: id ?? this.id,
        sol: sol ?? this.sol,
        camera: camera ?? this.camera,
        imgSrc: imgSrc ?? this.imgSrc,
        earthDate: earthDate ?? this.earthDate,
        rover: rover ?? this.rover,
      );

  @override
  List<Object?> get props => [
        id,
        sol,
        camera,
        imgSrc,
        earthDate,
        rover,
      ];
}

class Camera extends Equatable {
  final int id;
  final String name;
  final int roverId;
  final String fullName;

  const Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory Camera.empty() => const Camera(
        id: 0,
        name: '',
        roverId: 0,
        fullName: '',
      );

  Camera copyWith({
    int? id,
    String? name,
    int? roverId,
    String? fullName,
  }) =>
      Camera(
        id: id ?? this.id,
        name: name ?? this.name,
        roverId: roverId ?? this.roverId,
        fullName: fullName ?? this.fullName,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        roverId,
        fullName,
      ];
}

class Rover extends Equatable {
  final int id;
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;

  const Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  factory Rover.empty() => const Rover(
        id: 0,
        name: '',
        landingDate: '',
        launchDate: '',
        status: '',
      );

  Rover copyWith({
    int? id,
    String? name,
    String? landingDate,
    String? launchDate,
    String? status,
  }) =>
      Rover(
        id: id ?? this.id,
        name: name ?? this.name,
        landingDate: landingDate ?? this.landingDate,
        launchDate: launchDate ?? this.launchDate,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        landingDate,
        launchDate,
        status,
      ];
}
