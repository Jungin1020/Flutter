import 'dart:convert';
import 'dart:io';

import 'package:dart_basic/practice/practice_17_unit_test/exam5/model/post.dart';
import 'package:dart_basic/practice/practice_17_unit_test/exam5/repository/post_repository.dart';

class PostFileRepositoryImpl implements PostRepository {
  List<Map<String, dynamic>> _posts = [];

  @override
  Future<void> addPost(Post post) async {
    // final Map<String, dynamic> postJson2 = post.toJson();
    final Map<String, dynamic> postMap = post.toJson();

    // 데이터 리스트에 추가
    _posts.add(postMap);

    await savePost();
  }

  @override
  Future<void> deletePost(Post post) async {
    final Map<String, dynamic> postMap = post.toJson();

    // deletePost 인자로 들어온 데이터와 id 가 다른 데이터만 남겨놓는다.
    _posts = _posts.where((p) => p['id'] != postMap['id']).toList();

    await savePost();
  }

  @override
  Future<List<Post>> getPosts() async {
    return _posts.map((e) => Post.fromJson(e)).toList();
  }

  @override
  Future<void> updatePost(Post post) async {
    final Map<String, dynamic> postMap = post.toJson();

    _posts = _posts.map((e) {
      if (e['id'] == postMap['id']) {
        return postMap;
      }
      return e;
    }).toList();

    await savePost();
  }

  // @override
  Future<void> savePost() async {
    final String postMap = jsonEncode(_posts);

    File file = File('lib/practice/practice_17_unit_test/exam5/data/post.json');
    file.writeAsString(postMap);
  }
}
