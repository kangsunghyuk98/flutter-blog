
import 'package:flutter_01/domain/user/user.dart';
import 'package:flutter_01/domain/user/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수
  final principal = User().obs;

  Future<int> login (String username, String password) async{
    User principal = await _userRepository.login(username, password);

    if(principal.memSeq != null) {
      isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<void> logout() async{
    isLogin.value = false;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("jwtToken", "");
    print("token >>>>>>>>>> ${preferences.getString("jwtToken")}");
  }

  Future<String?> join (String username, String password, String email) async{
    String? result = await _userRepository.join(username, password, email);
    return result;
  }
}