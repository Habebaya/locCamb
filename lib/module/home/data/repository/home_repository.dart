import 'package:dartz/dartz.dart';
import 'package:loccamb/module/home/data/data_source/home_remote_data_source.dart';
import 'package:loccamb/module/home/data/models/user_model.dart';
import 'package:loccamb/module/home/domian/entities/user.dart';
import 'package:loccamb/module/home/domian/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepository(this.homeRemoteDataSource);

  @override
  Future<Either<String, List<User>>> getUsers() async {
    try {
      final result = await homeRemoteDataSource.getUsers();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

}
