class JoinReqDto {
  final String? memIdno;
  final String? memPw;
  final String? memName;

JoinReqDto(this.memIdno, this.memPw, this.memName);

  Map<String, dynamic> toJson() => {
    "memIdno" : memIdno,
    "memPw" : memPw,
    "memName" : memName
  };
}