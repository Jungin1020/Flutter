Future<String> timeoutFuture() async {
  try {
    final result = await Future.delayed(Duration(seconds: 6), () => 'ok')
        .timeout(Duration(seconds: 5));
    return result;
  } catch (e) {
    print('timeout');
    return '';
  }
}

Future<void> main() async {
  final String result = await timeoutFuture();
  print(result);
}
