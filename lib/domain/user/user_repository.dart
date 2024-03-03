import 'package:flutter_01/controller/dto/LoginRequestDto.dart';
import 'package:flutter_01/domain/user/user_provider.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 가공 json -> Dart Object
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login (String username, String password) async{
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    Response response = await _userProvider.login(loginReqDto.toJson());

    dynamic headers = response.headers;

    if(headers["authorization"] == null) {
      return "-1";
    } else {
      String token = headers["authorization"];
      return token;
    }
  }
}