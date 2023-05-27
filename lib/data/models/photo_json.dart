import 'package:cf_flutter/domain/models/photo.dart';

class PhotoJson {
  final int id;
  final int sol;
  final CameraJson camera;
  final String imgSrc;
  final String earthDate;
  final RoverJson rover;

  PhotoJson({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory PhotoJson.fromJson(Map<String, dynamic> json) => PhotoJson(
        id: json['id'] as int? ?? 0,
        sol: json['sol'] as int? ?? 0,
        camera: CameraJson.fromJson(json['camera']),
        imgSrc: json['img_src'],
        earthDate: json['earth_date'],
        rover: RoverJson.fromJson(json['rover']),
      );

  Photo toDomain() => Photo(
        id: id,
        sol: sol,
        camera: camera.toDomain(),
        imgSrc: imgSrc,
        earthDate: earthDate,
        rover: rover.toDomain(),
      );
}

class CameraJson {
  final int id;
  final String name;
  final int roverId;
  final String fullName;

  CameraJson({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory CameraJson.fromJson(Map<String, dynamic> json) => CameraJson(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        roverId: json['rover_id'] as int? ?? 0,
        fullName: json['full_name'] as String? ?? '',
      );

  Camera toDomain() => Camera(
        id: id,
        name: name,
        roverId: roverId,
        fullName: fullName,
      );
}

class RoverJson {
  final int id;
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;

  RoverJson({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  factory RoverJson.fromJson(Map<String, dynamic> json) => RoverJson(
        id: json['id'],
        name: json['name'],
        landingDate: json['landing_date'],
        launchDate: json['launch_date'],
        status: json['status'],
      );

  Rover toDomain() => Rover(
        id: id,
        name: name,
        landingDate: landingDate,
        launchDate: launchDate,
        status: status,
      );
}
