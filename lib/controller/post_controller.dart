
import 'package:flutter_01/domain/post/post.dart';
import 'package:flutter_01/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController{

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;


  @override
  void onInit() { // 컨트롤러 초기화 시 실행되는 함수
    super.onInit();
    findAll();
  }

  Future<void> findAll() async{
    List<Post> resPosts = await _postRepository.findAll();
    this.posts.value = resPosts;
  }
}