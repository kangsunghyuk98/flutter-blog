import 'package:flutter_01/controller/dto/CmmnResDto.dart';
import 'package:flutter_01/controller/dto/LoginRequestDto.dart';
import 'package:flutter_01/controller/dto/SaveOrUpdateRequestDto.dart';
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

  Future<Post> findById (int? id) async{
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    CmmnResDto cmmnResDto = CmmnResDto.fromJson(body);

    if(cmmnResDto.code == "000") {
      Post post = Post.fromJson(cmmnResDto.data);
      return post;
    } else{
      return Post();
    }
  }

  Future<String?> deleteById (int? id) async{
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    CmmnResDto cmmnResDto = CmmnResDto.fromJson(body);

    return cmmnResDto.code;
  }

  Future<Post> updateById (int? id, String title, String content) async{
    SaveOrUpdateRequestDto updateReqDto = SaveOrUpdateRequestDto(title, content, null, null);
    Response response = await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    CmmnResDto cmmnResDto = CmmnResDto.fromJson(body);

    if(cmmnResDto.code == "000") {
      print("수정성공");
      Post post = Post.fromJson(cmmnResDto.data);
      return post;
    } else {
      print("수정실패");
      return Post();
    }
  }

  Future<String?> save (String title, String content, String writer, int writerCd) async{
    SaveOrUpdateRequestDto saveOrUpdateRequestDto = SaveOrUpdateRequestDto(title, content, writer, writerCd);
    Response response = await _postProvider.save(saveOrUpdateRequestDto.toJson());
    dynamic body = response.body;
    CmmnResDto cmmnResDto = CmmnResDto.fromJson(body);

    return cmmnResDto.code;
  }

}