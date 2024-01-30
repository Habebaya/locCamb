import 'package:loccamb/core/constant/api.dart';
import 'package:loccamb/module/home/data/models/user_model.dart';

import '../../../../core/network/network_service.dart';
import 'package:dio/dio.dart';



class HomeRemoteDataSource  {
  final ApiHelper _apiHelper ;
  HomeRemoteDataSource(this._apiHelper);

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];

    Response response;
    const url = '${ApiConstants.baseUrl}${ApiConstants.usersPrefix}';
    response = await _apiHelper.get(url);

    if (response.statusCode == 200) {
      print(response.data);
      final List userList = response.data;
      for (var element in userList) {
        users.add(UserModel.fromJson(element));
      }
      return users;
    } else {
      throw Exception();
    }
  }
}
