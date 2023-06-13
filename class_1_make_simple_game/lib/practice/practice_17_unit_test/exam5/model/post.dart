// class Post {
//   int id;
//   String title;
//   String body;
//
//   Post(this.id, this.title, this.body);
// }

class Post {
  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  Post.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  late int id;
  late String title;
  late String body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}
