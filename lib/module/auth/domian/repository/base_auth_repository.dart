import 'package:dartz/dartz.dart';


abstract class BaseAuthRepository{
  Future<Either<String,String>>  registerWithEmail({email,password});
  Future<Either<String,String>>  loginWithEmail({email,password});


}