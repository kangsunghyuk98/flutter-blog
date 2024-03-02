class LoginReqDto {
  final String? memIdno;
  final String? memPw;

  LoginReqDto(this.memIdno, this.memPw);

  Map<String, dynamic> toJson() => {
    "memIdno" : memIdno,
    "memPw" : memPw,
  };
}