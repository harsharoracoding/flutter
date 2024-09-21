import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_final_project/api_integration_class/model/repo/user_repo.dart';
import 'package:new_final_project/api_integration_class/model/response/user_list_response.dart';
import 'package:http/http.dart' as http;
class UserViewmodel extends ChangeNotifier {
  UserListResponse _userListResponse = UserListResponse();

  UserListResponse get userListResponse => _userListResponse;

  UserRepo _userRepo = UserRepo();

  Future<void> getListOfUsers(String url) async {

    //THIS IS WHEN WE ARE FOLLOWING MVVM STRUCTURE
   // _userListResponse = await _userRepo.getUserList(url);

    // THIS IS WHEN WE ARE NOT FOLLOWING MVVM STRUCTURE
    final response=await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      final jsonResponse = jsonDecode(response.body);
      _userListResponse=UserListResponse.fromJson(jsonResponse);
    }


    notifyListeners();
  }
}
