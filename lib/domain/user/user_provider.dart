import 'package:get/get.dart';

const host = "http://192.168.0.102:8080";

// 통신을 수행
class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/login", data); // Promise
  Future<Response> join(Map data) => post("$host/join", data);
}
