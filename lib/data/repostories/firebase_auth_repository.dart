import 'package:cf_flutter/domain/failures/sign_in_failure.dart';
import 'package:cf_flutter/domain/models/user.dart';
import 'package:cf_flutter/domain/respositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<Either<SignInFailure, User>> signInAnonymously() async {
    try {
      final userCredential = await auth.FirebaseAuth.instance.signInAnonymously();
      print(userCredential.user?.uid);
      return right(User(uid: userCredential.user?.uid ?? ''));
    } on auth.FirebaseAuthException catch (e) {
      return left(SignInFailure(friendlyErrorString: e.message ?? ''));
    }
  }
}
