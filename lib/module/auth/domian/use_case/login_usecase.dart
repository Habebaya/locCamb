
import 'package:loccamb/module/auth/domian/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';


class LoginUseCase {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  Future<Either<String,String>>  execute(String email,String password) async {
    return await baseAuthRepository.loginWithEmail(email: email,password: password);
  }
}
