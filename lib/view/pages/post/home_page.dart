import 'package:flutter/material.dart';
import 'package:flutter_01/controller/post_controller.dart';
import 'package:flutter_01/controller/user_controller.dart';
import 'package:flutter_01/domain/post/post.dart';
import 'package:flutter_01/size.dart';
import 'package:flutter_01/view/pages/post/write_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../user/login_page.dart';
import '../user/user_info.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // put은 없으면 만들고, 있으면 찾기 / 이미 로그인 시 컨트롤러 주입 받았으니 find로 찾음
    UserController u = Get.find();
    PostController p = Get.put(PostController());

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Obx(() => Text("${u.isLogin}")), // isLogin의 값이 바뀔때마다 자동으로 갱신시켜줌
      ),
      body: Obx(() => ListView.separated(
        itemCount: p.posts.length,
        itemBuilder: (context, index) { // index는 seq
          return ListTile(
            onTap: () {
              p.findById(p.posts[index].bbsSeq);
              Get.to(DetailPage(p.posts[index].bbsSeq), arguments: "arguments 속성 테스트");
            },
            title: Text("${p.posts[index].bbsTitle}"),
            leading: Text("${p.posts[index].bbsSeq}"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )),
    );
  }

  Widget _navigation(BuildContext context) {

    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: (){
                    Get.to(WritePage());
                  },
                  child: Text(
                    "글쓰기",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
              ),
              TextButton(
                  onPressed: (){
                    Get.to(UserInfo());
                  },
                  child: Text(
                    "회원 상세",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
              ),
              TextButton(
                  onPressed: (){
                    u.logout();
                    Get.to(() => LoginPage());
                  },
                  child: Text(
                    "로그 아웃",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
