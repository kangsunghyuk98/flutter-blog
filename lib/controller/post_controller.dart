
import 'package:flutter_01/domain/post/post.dart';
import 'package:flutter_01/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController{

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() { // 컨트롤러 초기화 시 실행되는 함수
    super.onInit();
    findAll();
  }

  Future<void> findAll() async{
    List<Post> resPosts = await _postRepository.findAll();
    this.posts.value = resPosts;
  }

  Future<void> findById(int? id) async{
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }

  Future<void> deleteById(int? id) async{
    String? result = await _postRepository.deleteById(id);

    if(result == "000") {
      List<Post> result = posts.where((val) => val.bbsSeq != id).toList();
      posts.value = result;
    }
  }

  Future<void> updateById(int? id, String title, String content) async{
    Post post = await _postRepository.updateById(id, title, content);
    if(post.bbsSeq != null) {
      this.post.value = post;
      this.posts.value = this.posts.map((e) => e.bbsSeq == id ? post : e).toList();
    }
  }

  Future<void> save (String title, String content) async{
    Post post = await _postRepository.save(title, content);
    if(post.bbsSeq != null) {
      this.posts.add(post);
    }
  }

}