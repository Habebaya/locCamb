import 'package:loccamb/module/auth/domian/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:loccamb/module/home/domian/entities/user.dart';
import 'package:loccamb/module/home/domian/repository/base_home_repository.dart';

class GetUserUseCase {
  final BaseHomeRepository baseHomeRepository;

  GetUserUseCase(this.baseHomeRepository);

  Future<Either<String, List<User>>> execute() async {
    return await baseHomeRepository.getUsers();
  }
}
