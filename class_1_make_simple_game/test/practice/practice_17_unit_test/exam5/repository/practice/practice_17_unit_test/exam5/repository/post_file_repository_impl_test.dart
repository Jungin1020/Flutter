import 'package:dart_basic/practice/practice_17_unit_test/exam5/model/post.dart';
import 'package:dart_basic/practice/practice_17_unit_test/exam5/repository/post_file_repository_impl.dart';
import 'package:dart_basic/practice/practice_17_unit_test/exam5/repository/post_repository.dart';
import 'package:test/test.dart';

void main() {
  PostRepository _repository = PostFileRepositoryImpl();

  setUp(() async {
    _repository.addPost(Post(id: 0, title: 'test1', body: 'test1'));
    _repository.addPost(Post(id: 1, title: 'test2', body: 'test2'));
  });

  tearDown(() async {
    _repository = PostFileRepositoryImpl();
  });

  test('파일에 데이터가 잘 추가 되는지', () async {
    _repository.addPost(Post(id: 2, title: 'test3', body: 'test3'));
    var posts = await _repository.getPosts();
    // _repository.savePost();

    expect(posts.length, 3);
  });

  test('파일에 데이터가 잘 삭제 되는지', () async {
    _repository.deletePost(Post(id: 2, title: 'test3', body: 'test3'));
    var posts = await _repository.getPosts();
    // _repository.savePost();

    expect(posts.length, 2);
  });
}
