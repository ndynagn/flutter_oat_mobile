import 'dart:math';

String generateRandomString(int len) {
  final randrom = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(
    len,
    (index) => chars[randrom.nextInt(chars.length)],
  ).join();
}
