import 'package:dart_basic/practice/practice_17_unit_test/exam5/model/post.dart';
import 'package:dart_basic/practice/practice_17_unit_test/exam5/repository/post_memory_repository_impl.dart';
import 'package:dart_basic/practice/practice_17_unit_test/exam5/repository/post_repository.dart';
import 'package:test/test.dart';

void main() {
  PostRepository _repository = PostMemoryRepositoryImpl();

  setUp(() async {
    _repository.addPost(Post(id: 0, title: 'test1', body: 'test1'));
    _repository.addPost(Post(id: 1, title: 'test2', body: 'test3'));
  });

  tearDown(() async {
    _repository = PostMemoryRepositoryImpl();
  });

  group('PostRepository', () {
    test('getPosts()', () async {
      final posts = await _repository.getPosts();
      expect(posts.length, 2);
    });

    test('addPost()', () async {
      await _repository.addPost(Post(id: 2, title: 'test3', body: 'test3'));

      var posts = await _repository.getPosts();
      expect(posts.length, 3);

      await _repository.addPost(Post(id: 3, title: 'test4', body: 'test4'));

      posts = await _repository.getPosts();
      expect(posts.length, 4);
    });

    test('updatePost()', () async {
      await _repository.updatePost(Post(id: 0, title: '0', body: '0'));
      final firstPost = (await _repository.getPosts())[0];
      expect(firstPost.title, '0');
    });

    test('deletePost()', () async {
      final post = Post(id: 0, title: 'test1', body: 'test1');
      await _repository.deletePost(post);
      final posts = await _repository.getPosts();
      expect(posts.length, 1);
    });
  });

  test('PostMemoryRepository 테스트', () async {
    // 준비
    final PostRepository repository = PostMemoryRepositoryImpl();

    final posts = await repository.getPosts();
    expect(posts.length, 0);

    final post = Post(id: 0, title: 'test1', body: 'test1');
    await repository.addPost(post);
    expect(posts.length, 1);

    await repository.updatePost(Post(id: 0, title: 'test2', body: 'test2'));
    final firstPost = (await repository.getPosts())[0];
    expect(firstPost.title, 'test2');

    await repository.deletePost(post);
    expect(posts.length, 1);
  });
}
