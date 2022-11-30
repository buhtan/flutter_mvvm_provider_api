import 'package:dio/dio.dart';
import 'package:flutter_mvvm_provider_api/model/user_model.dart';


import '../constants/application_constants.dart';

class WebService {
  Future<List<userModel>> fetchUsers() async {
    final response = await Dio().get(ApplicationConstants.API_URL);
    List<userModel> _userList = [];
    if (response.statusCode == 200) {
      _userList =
          (response.data as List).map((e) => userModel.fromJson(e)).toList();
    }
    

    return _userList;
  }
}
