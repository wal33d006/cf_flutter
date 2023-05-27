import 'package:cf_flutter/domain/failures/sign_in_failure.dart';
import 'package:cf_flutter/domain/models/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<SignInFailure, User>> signInAnonymously();
}
