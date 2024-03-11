import 'package:flutter/material.dart';
import 'package:flutter_01/controller/post_controller.dart';
import 'package:flutter_01/controller/user_controller.dart';
import 'package:flutter_01/view/pages/post/update_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {

  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {

    // dynamic type
    // String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("$id, isLogin : ${u.isLogin}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${p.post.value.bbsTitle}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
            Divider(),
            u.principal.value.memSeq == p.post.value.bbsWriterCd ? Row(
              children: [
                ElevatedButton(
                    onPressed: () async{
                      await p.deleteById(p.post.value.bbsSeq);
                      Get.off(() => HomePage()); // 상태관리로 갱신 시킬 수 있음.
                    },
                    child: Text("삭제")
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){
                      Get.to(() => UpdatePage());
                    },
                    child: Text("수정")
                ),
              ],
            ) : SizedBox(),
            Expanded(
              child: SingleChildScrollView( // 상세에서 글이 엄청나게 길어질 수도 있기 때문에
                  child: Text("${p.post.value.bbsContents}")
              ),
            )
          ],
        )),
      )
    );
  }
}
