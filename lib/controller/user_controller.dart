
import 'package:flutter_01/domain/user/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();

  Future<String> login (String username, String password) async{
    String token = await _userRepository.login(username, password);

    if(token != "-1") {
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("jwtToken", token);
      print(preferences.getString("jwtToken"));
    }
    return token;
  }
}