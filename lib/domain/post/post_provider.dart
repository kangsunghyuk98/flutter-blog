import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const host = "http://192.168.0.102:8080/api/v1/user";

// 통신을 수행
class PostProvider extends GetConnect {

  Future<Response> findAll() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("jwtToken");

    return get("$host/post", headers: {
      "Authorization" : token ?? ""
    });
  }

  Future<Response> findById(int? id) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("jwtToken");

    return get("$host/post/$id", headers: {
      "Authorization" : token ?? ""
    });
  }

  Future<Response> deleteById(int? id) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("jwtToken");

    return delete("$host/post/$id", headers: {
      "Authorization" : token ?? ""
    });
  }

  Future<Response> updateById(int? id, Map data) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("jwtToken");

    return put("$host/post/$id", data ,headers: {
      "Authorization" : token ?? ""
    });
  }
}
