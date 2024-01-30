
import 'package:loccamb/module/auth/domian/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';


class RegisterUseCase {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase(this.baseAuthRepository);

  Future<Either<String,String>>  execute(String email,String password) async {
    return await baseAuthRepository.registerWithEmail(email: email,password: password);
  }
}
