import 'package:cf_flutter/data/models/network_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio();

  Future<Either<NetworkFailure, Map<String, dynamic>>> get(String url) async {
    try {
      return right((await dio.get(url)).data as Map<String, dynamic>);
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }
}
