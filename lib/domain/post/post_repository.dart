import 'package:flutter_01/controller/dto/LoginRequestDto.dart';
import 'package:flutter_01/domain/post/post_provider.dart';
import 'package:flutter_01/domain/user/user_provider.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 가공 json -> Dart Object
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<void> findAll () async{
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    print(body);
  }
}