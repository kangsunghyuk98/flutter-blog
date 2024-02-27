import 'package:flutter/material.dart';
import 'package:flutter_01/pages/post/detail_page.dart';
import 'package:flutter_01/size.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 20,
          itemBuilder: (context, index) { // index는 seq
            return ListTile(
              onTap: () {
                Get.to(DetailPage(index), arguments: "arguments 속성 테스트");
              },
              title: Text("제목1"),
              leading: Text("1"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: (){},
                  child: Text(
                    "글쓰기",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
              ),
              Divider(),
              TextButton(
                  onPressed: (){},
                  child: Text(
                    "회원 상세",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
              ),
              Divider(),
              TextButton(
                  onPressed: (){},
                  child: Text(
                    "로그 아웃",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
