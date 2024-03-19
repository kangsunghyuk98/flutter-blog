class SaveOrUpdateRequestDto {
  final String? bbsTitle;
  final String? bbsContents;
  final String? bbsWriter;
  final int? bbsWriterCd;

  SaveOrUpdateRequestDto(this.bbsTitle, this.bbsContents, this.bbsWriter, this.bbsWriterCd);

  Map<String, dynamic> toJson() => {
    "bbsTitle" : bbsTitle,
    "bbsContents" : bbsContents,
    "bbsWriter" : bbsWriter,
    "bbsWriterCd" : bbsWriterCd,
  };
}