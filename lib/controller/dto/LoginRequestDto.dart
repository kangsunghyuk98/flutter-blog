class LoginReqDto {
  final String? strMemIdno;
  final String? strRawPw;

  LoginReqDto(this.strMemIdno, this.strRawPw);

  Map<String, dynamic> toJson() => {
    "strMemIdno" : strMemIdno,
    "strRawPw" : strRawPw,
  };
}