import 'dart:io';

void copy(String source, String target) {
  File(source).copySync(target);
}

void main() {
  String source = 'lib/practice/ect/길동이.json';
  String target = 'lib/practice/ect/길동이_copy.json';

  copy(source, target);
}
