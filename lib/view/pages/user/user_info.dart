import 'package:flutter/material.dart';
import 'package:flutter_01/controller/user_controller.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    UserController u = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원 번호 : ${u.principal.value.memSeq}"),
            Text("회원 아이디: ${u.principal.value.memIdno}"),
            Text("회원 생일: ${u.principal.value.memBirth}"),
            Text("회원 티어: ${u.principal.value.memTier}"),
          ],
        ),
      ),
    );
  }
}
