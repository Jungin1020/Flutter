import 'dart:io';

void copy(String source, String target) {
  File(source).copySync(target);
}

void main() {
  String source = '길동이.json';
  String target = '길동이2.json';

  copy(source, target);
}
