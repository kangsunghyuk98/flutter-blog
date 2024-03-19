class SaveOrUpdateRequestDto {
  final String? bbsTitle;
  final String? bbsContents;

  SaveOrUpdateRequestDto(this.bbsTitle, this.bbsContents);

  Map<String, dynamic> toJson() => {
    "bbsTitle" : bbsTitle,
    "bbsContents" : bbsContents,
  };
}