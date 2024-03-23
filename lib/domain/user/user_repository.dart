import 'package:flutter_01/controller/dto/CmmnResDto.dart';
import 'package:flutter_01/controller/dto/LoginRequestDto.dart';
import 'package:flutter_01/domain/user/user.dart';
import 'package:flutter_01/domain/user/user_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 통신을 호출해서 응답되는 데이터를 가공 json -> Dart Object
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login (String username, String password) async{
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    Response response = await _userProvider.login(loginReqDto.toJson());

    dynamic body = response.body;
    dynamic headers = response.headers;

    CmmnResDto cmmnResDto = CmmnResDto.fromJson(body);

    if(cmmnResDto.code == "000") {
      User principal = User.fromJson(cmmnResDto.data);
      String token = headers["authorization"];

      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("jwtToken", token);
      print(preferences.getString("jwtToken"));

      return principal;
    } else {
      return User();
    }
  }
}