import 'dart:convert';
import 'dart:io';

import 'package:dart_basic/practice/practice_17_unit_test/exam5/model/post.dart';
import 'package:dart_basic/practice/practice_17_unit_test/exam5/repository/post_repository.dart';

class PostFileRepositoryImpl implements PostRepository {
  List<Map<String, dynamic>> _posts = [];

  @override
  Future<void> addPost(Post post) async {
    // final Map<String, dynamic> postJson2 = post.toJson();
    final Map<String, dynamic> postJson = post.toJson();

    // 데이터 리스트에 추가
    _posts.add(postJson);

    // // Json으로 저장
    // File file = File('post.json');
    // file.writeAsString(postJson);
  }

  @override
  Future<void> deletePost(Post post) async {
    final Map<String, dynamic> postJson = post.toJson();
    _posts.where((p) => p['id'] != post.id).toList();

    // _posts.remove(post);
  }

  @override
  Future<List<Map<String, dynamic>>> getPosts() async {
    return _posts;
  }

  @override
  Future<void> updatePost(Post post) async {
    // _posts = _posts.map((e) {
    //   if (e.id == post.id) {
    //     return post;
    //   }
    //   return e;
    // }).toList();

    final Map<String, dynamic> postJson = post.toJson();

    _posts = _posts.map((e) {
      if (e['id'] == postJson['id']) {
        return postJson;
      }
      return e;
    }).toList();
  }

  // @override
  Future<void> savePost() async {
    final String postJson = jsonEncode(_posts);

    File file = File('post.json');
    file.writeAsString(postJson);
  }
}
