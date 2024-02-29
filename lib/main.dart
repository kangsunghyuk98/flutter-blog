import 'package:flutter/material.dart';
import 'package:flutter_01/view/pages/post/home_page.dart';
import 'package:flutter_01/view/pages/user/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
