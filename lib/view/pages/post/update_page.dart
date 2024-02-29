import 'package:flutter/material.dart';
import 'package:flutter_01/utils/validator_util.dart';
import 'package:get/route_manager.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextFormField(
                  hint: "Title",
                  funValidator: validateTitle(),
                  value: "제목1"*2,
                ),
                CustomTextarea(
                  hint: "Content",
                  funValidator: validateContent(),
                  value: "내용1"*20,
                ),
                CustomElevatedButton(
                  text: "수정하기",
                  funPageRoute: () {
                    if(_formKey.currentState!.validate()) {
                      Get.back(); // 상태관리 라이브러리 Obs 사용할거임
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
