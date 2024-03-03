
import 'package:flutter_01/domain/user/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수

  Future<String> login (String username, String password) async{
    String token = await _userRepository.login(username, password);

    if(token != "-1") {
      isLogin.value = true;
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("jwtToken", token);
      print(preferences.getString("jwtToken"));
    }
    return token;
  }

  Future<void> logout() async{
    isLogin.value = false;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("jwtToken", "");
    print("token >>>>>>>>>> ${preferences.getString("jwtToken")}");
  }
}