
import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body) {
  String responseBody = jsonEncode(body); // codeUnits 타입을 사용하기 위해
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}