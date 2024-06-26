import 'package:flutter/material.dart';
import 'package:flutter_01/controller/post_controller.dart';
import 'package:flutter_01/utils/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _contents = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final PostController p = Get.find();

    _title.text = "${p.post.value.bbsTitle}";
    _contents.text = "${p.post.value.bbsContents}";

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextFormField(
                  controller: _title,
                  hint: "Title",
                  funValidator: validateTitle(),
                ),
                CustomTextarea(
                  controller: _contents,
                  hint: "Content",
                  funValidator: validateContent(),
                ),
                CustomElevatedButton(
                  text: "수정하기",
                  funPageRoute: () async {
                    if(_formKey.currentState!.validate()) {
                      await p.updateById(p.post.value.bbsSeq, _title.text, _contents.text);
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
