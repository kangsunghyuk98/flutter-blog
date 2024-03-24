import 'package:flutter/material.dart';
import 'package:flutter_01/controller/user_controller.dart';
import 'package:flutter_01/utils/validator_util.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:validators/validators.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'login_page.dart';

class JoinPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  UserController u = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                  "서비스 회원가입",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            controller: _email,
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomElevatedButton(
              text: "회원가입",
              funPageRoute: () {
                if(_formKey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              }
          ),
          TextButton(
              onPressed: () async{
                String? result = await u.join(_username.text.trim(), _password.text.trim(), _email.text.trim());
                if(result == "000") {
                  Get.to(LoginPage());
                } else {
                  print("회원가입 실패하였습니다.");
                }
              },
              child: Text("로그인 페이지로 이동")
          ),
        ],
      )
    );
  }
}
