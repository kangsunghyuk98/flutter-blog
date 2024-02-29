
import 'package:intl/intl.dart';

class User {
  final int? nMemSeq;
  final String? strMemIdno;
  final String? strMemBirth;
  final String? strMemGender;
  final String? strMemTier;
  final String? strMemClub;
  final String? strMemCrew;

  final String? code;
  final String? message;

  User({
    this.nMemSeq,
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
      : nMemSeq = json["id"],
        strMemIdno = json["title"],
        strMemBirth = json["content"],
        strMemGender = json["strMemGender"],
        strMemTier = json["strMemTier"],
        strMemClub = json["strMemClub"],
        strMemCrew = json["strMemCrew"],
        code = json["code"],
        message = json["message"];
}
