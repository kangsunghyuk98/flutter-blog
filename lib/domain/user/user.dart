
import 'package:intl/intl.dart';

class User {
  final int? memSeq;
  final String? memIdno;
  final String? memBirth;
  final String? memGender;
  final String? memTier;
  final String? memClub;
  final String? memCrew;

  final String? code;
  final String? message;

  User({
    this.memSeq,
    this.memIdno,
    this.memBirth,
    this.memGender,
    this.memTier,
    this.memClub,
    this.memCrew,
    this.code,
    this.message
  });

  User.fromJson(Map<String, dynamic> json)
      : memSeq =    json["memSeq"],
        memIdno =   json["memIdno"],
        memBirth =  json["memBirth"],
        memGender = json["memGender"],
        memTier =   json["memTier"],
        memClub =   json["memClub"],
        memCrew =   json["memCrew"],
        code =      json["code"],
        message =   json["message"];
}
