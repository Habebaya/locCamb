import 'package:dartz/dartz.dart';

import '../../domian/repository/base_auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepository extends BaseAuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository(this.authDataSource);

  @override
  Future<Either<String, String>> registerWithEmail({email, password}) async {
    try {
      final result = await authDataSource.registerWithEmail(email, password);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

// @override
// Future<Either<Failure, User>> loginWithEmailAndPassword(
//     String email, String password) async {
//   try {
//     final result =
//     await authDataSource.loginWithEmailAndPassword(email, password);
//     return Right(result);
//   } on Failure catch (e) {
//     return Left(Failure(e.value));
//   }
// }
}
