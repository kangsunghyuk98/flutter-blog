import 'package:flutter/material.dart';
import 'package:flutter_01/pages/user/login_page.dart';
import 'package:get/route_manager.dart';

class CustomElevatedButton extends StatelessWidget {

  final String text;
  final funPageRoute;

  const CustomElevatedButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
      onPressed: funPageRoute,
      child: Text("$text"),
    );
  }
}