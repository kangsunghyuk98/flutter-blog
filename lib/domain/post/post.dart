
import 'package:flutter_01/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int? bbsSeq;
  final String? bbsTitle;
  final String? bbsContents;
  final String? bbsWriter;
  final int? bbsWriterCd;
  final String? bbsRegDt;
  final String? bbsRegHms;

  Post({this.bbsSeq, this.bbsTitle, this.bbsContents, this.bbsWriter, this.bbsWriterCd, this.bbsRegDt, this.bbsRegHms});

  Post.fromJson(Map<String, dynamic> json)
      : bbsSeq = json["bbsSeq"],
        bbsTitle = json["bbsTitle"],
        bbsContents = json["bbsContents"],
        bbsWriter = json["bbsWriter"],
        bbsWriterCd = json["bbsWriterCd"],
        bbsRegDt = json["bbsRegDt"],
        bbsRegHms = json["bbsRegHms"];
}
