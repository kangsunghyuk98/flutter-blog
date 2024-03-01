
import 'package:intl/intl.dart';

class User {
  final int? nmemSeq;
  final String? strMemIdno;
  final String? strMemBirth;
  final String? strMemGender;
  final String? strMemTier;
  final String? strMemClub;
  final String? strMemCrew;

  final String? code;
  final String? message;

  User({
    this.nmemSeq,
    this.strMemIdno,
    this.strMemBirth,
    this.strMemGender,
    this.strMemTier,
    this.strMemClub,
    this.strMemCrew,
    this.code,
    this.message
  });

  User.fromJson(Map<String, dynamic> json)
      : nmemSeq = json["nmemSeq"],
        strMemIdno = json["strMemIdno"],
        strMemBirth = json["strMemBirth"],
        strMemGender = json["strMemGender"],
        strMemTier = json["strMemTier"],
        strMemClub = json["strMemClub"],
        strMemCrew = json["strMemCrew"],
        code = json["code"],
        message = json["message"];
}
