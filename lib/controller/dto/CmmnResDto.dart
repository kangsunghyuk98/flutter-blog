
import 'package:intl/intl.dart';

class CmmnResDto {
  final String? code;
  final String? msg;
  final dynamic data;

  CmmnResDto({
    this.code,
    this.msg,
    this.data,
  });

  CmmnResDto.fromJson(Map<String, dynamic> json)
      : code =    json["code"],
        msg =   json["msg"],
        data =  json["data"];
}
