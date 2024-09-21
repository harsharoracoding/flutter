import 'dart:convert';

import 'package:new_final_project/api_integration_class/model/response/user_list_response.dart';
import 'package:new_final_project/api_integration_class/model/services/user_service.dart';

class UserRepo {
  UserService userService = UserService();

  Future<UserListResponse> getUserList(String url) async {
    final response = await userService.get(url);
    return UserListResponse.fromJson(jsonDecode(response));
  }
}
