import 'package:flutter/material.dart';
import 'package:flutter_01/controller/post_controller.dart';
import 'package:flutter_01/controller/user_controller.dart';
import 'package:flutter_01/utils/validator_util.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  UserController u = Get.find();

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
              controller: _title,
              hint: "Title",
              funValidator: validateTitle(),
            ),
            CustomTextarea(
                controller: _content,
                hint: "Content",
                funValidator: validateContent(),
            ),
            CustomElevatedButton(
              text: "글쓰기",
              funPageRoute: () async{
                if(_formKey.currentState!.validate()) {
                  await Get.find<PostController>()
                      .save(_title.text, _content.text, u.principal.value.memIdno, u.principal.value.memSeq);
                  Get.off(() => HomePage());
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
