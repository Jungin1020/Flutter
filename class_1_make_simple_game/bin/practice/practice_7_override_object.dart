class Book {
  final title;
  final comment;

  // final DateTime publishDate = DateTime.now();
  final String publishDate = '2023.05.30';

  @override // == 연산자 오버라이딩
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override // 해시코드 오버라이딩
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  Book({
    required this.title,
    required this.comment,
  });

  Book copyWith({String? title, String? comment}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
    );
  }
}

void main() {
  final book1 = Book(title: '생존코딩', comment: '코멘트');
  final book2 = Book(title: '생존코딩', comment: '코멘트');
  final book3 = Book(title: '생존코딩', comment: '뭐라하지');
  final book4 = Book(title: '쉽고빠른앱개발', comment: '하하하');
  final book5 = Book(title: '두잇플러터', comment: '크크크');

  print(book1 == book2); // true
  print(book1 == book3); // true
  print(book1 == book4); // false

  final bookList = <Book>[book1, book2, book3, book4, book5];

  print(book1 == book2); // true
  print(book1 == book3); // true
  print(book1 == book4); // false
  print(book1 == book5); // false

  final book6 = book1.copyWith();

  print('book1: ${book1.hashCode}, book6: ${book6.hashCode}'); // 같은 해시코드
}
