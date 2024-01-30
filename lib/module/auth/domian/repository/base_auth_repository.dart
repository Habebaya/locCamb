import 'package:dartz/dartz.dart';


abstract class BaseAuthRepository{
  Future<Either<String,String>>  registerWithEmail({email,password});
  // Future<Either<bool, NewsDetails>> getNewsDetails(int id);


}