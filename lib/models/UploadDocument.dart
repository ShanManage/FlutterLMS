class UploadDocument {
  String docGrade;
  String docSubject;
  String docType;
  String title;
  String thumbnailURL;
  String docURL;

  String toString() {
    return "docGrade : " +
        docGrade.toString() +
        "docSubject : " +
        docSubject.toString() +
        "docType : " +
        docType.toString() +
        "title : " +
        title.toString() +
        "thumbnail : " +
        thumbnailURL.toString() +
        "docURL : " +
        docURL.toString();
  }
}
