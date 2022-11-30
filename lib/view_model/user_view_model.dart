import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_provider_api/model/user_model.dart';
import 'package:flutter_mvvm_provider_api/service/web_service.dart';

enum userState { IDLE, BUSY, ERROR }

class userViewModel with ChangeNotifier {
 late userState _state;

  late List<userModel> userList;

  userViewModel() {
     userList = [];
    _state = userState.IDLE;
   
    fetchUsers();
  }

  userState get state => _state;
  set state(userState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<userModel>> fetchUsers() async {
    try {
      state = userState.BUSY;
      userList = await WebService().fetchUsers();
      state = userState.IDLE;
      return userList;
    } catch (e) {
      state = userState.ERROR;
      
      return [];
    }
  }
}
