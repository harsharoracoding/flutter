import 'package:flutter/material.dart';
import 'package:new_final_project/api_integration_class/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    context
        .read<UserViewmodel>()
        .getListOfUsers("https://reqres.in/api/users?page=2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserViewmodel>(
        builder: (BuildContext context, UserViewmodel value, Widget? child) {
          return value.userListResponse.data != null
              ? ListView.builder(
              itemCount: value.userListResponse.data?.length,
              itemBuilder: (context, index) {
                final user = value.userListResponse.data?[index];
                return ListTile(
                  title: Text("${user?.first_name} ${user?.last_name}"),
                  subtitle: Text(user?.email ?? ""),
                  leading: Image.network(user?.avatar ?? ""),
                );
              })
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
