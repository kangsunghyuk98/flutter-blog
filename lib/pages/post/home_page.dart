import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 300,
        height: double.infinity,
        color: Colors.blue,
      ),
      appBar: AppBar(),
      body: Text("Home Page"),
    );
  }
}
