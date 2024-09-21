import 'package:flutter/material.dart';
import 'package:new_final_project/api_integration_class/view/screen/splash_screen.dart';
import 'package:new_final_project/api_integration_class/view/screen/user_list_screen.dart';
import 'package:new_final_project/api_integration_class/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserViewmodel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.blue,
            secondary: Colors.blue),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: UserListScreen(),
    );
  }
}

class HelloWorld extends StatefulWidget {
  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    print("BUILD CALLED");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Hello World")],
      ),
    );
  }
}