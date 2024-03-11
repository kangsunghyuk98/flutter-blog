class UpdateReqDto {
  final String? bbsTitle;
  final String? bbsContents;

  UpdateReqDto(this.bbsTitle, this.bbsContents);

  Map<String, dynamic> toJson() => {
    "bbsTitle" : bbsTitle,
    "bbsContents" : bbsContents,
  };
}