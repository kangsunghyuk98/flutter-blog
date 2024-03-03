import 'package:flutter_01/controller/dto/CmmnResDto.dart';
import 'package:flutter_01/controller/dto/LoginRequestDto.dart';
import 'package:flutter_01/domain/post/post.dart';
import 'package:flutter_01/domain/post/post_provider.dart';
import 'package:flutter_01/domain/user/user_provider.dart';
import 'package:flutter_01/utils/convert_utf8.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 가공 json -> Dart Object
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll () async{
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    CmmnResDto cmmnResDto = CmmnResDto.fromJson(body);
    // print(cmmnResDto.code);
    // print(cmmnResDto.msg);
    // print(cmmnResDto.data);

    if(cmmnResDto.code == "000") {
      List<dynamic> tmp = cmmnResDto.data;
      List<Post> resPosts = tmp.map((post) => Post.fromJson(post)).toList();
      return resPosts;
    } else{
      return <Post>[];
    }
  }
}