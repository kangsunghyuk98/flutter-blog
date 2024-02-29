import 'package:flutter/material.dart';
import 'package:flutter_01/view/pages/post/update_page.dart';
import 'package:get/route_manager.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {

  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {

    // dynamic type
    // String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("글제목", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                    onPressed: (){
                      Get.off(HomePage()); // 상태관리로 갱신 시킬 수 있음.
                    },
                    child: Text("삭제")
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){
                      Get.to(UpdatePage());
                    },
                    child: Text("수정")
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView( // 상세에서 글이 엄청나게 길어질 수도 있기 때문에
                  child: Text("글내용"*500)
              ),
            )
          ],
        ),
      )
    );
  }
}
