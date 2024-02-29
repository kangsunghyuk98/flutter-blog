import 'package:get/get.dart';

const host = "http://192.168.0.100:8080";

// 통신을 수행
class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/api/auth01S01", data); // Promise
}
