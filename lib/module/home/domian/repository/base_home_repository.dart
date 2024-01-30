import 'package:dartz/dartz.dart';
import 'package:loccamb/module/home/domian/entities/user.dart';


abstract class BaseHomeRepository{
  Future<Either<String,List<User>>>  getUsers();


}