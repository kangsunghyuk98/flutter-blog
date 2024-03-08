import 'package:flutter/material.dart';
import 'package:flutter_01/controller/user_controller.dart';
import 'package:flutter_01/domain/user/user_repository.dart';
import 'package:flutter_01/utils/validator_util.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../post/home_page.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();

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
                "로그인",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
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
            CustomElevatedButton(
              text: "로그인",
              funPageRoute: () async{
                if(_formKey.currentState!.validate()) {
                  // Get.to(HomePage());
                  int res = await u.login(_username.text.trim(), _password.text.trim());
                  if(res == 1) {
                    print("토큰을 정상적으로 받음");
                    Get.to(() => HomePage());
                  } else {
                    print("토큰을 정상적으로 못받음");
                    Get.snackbar("Flutter App", "입력 정보를 다시 확인해 주세요.");
                  }
                }
              },
            ),
            TextButton(
                onPressed: (){
                  Get.to(JoinPage());
                },
                child: Text("아직 회원가입이 안되어있나요?")
            )
          ],
        )
    );
  }
}
