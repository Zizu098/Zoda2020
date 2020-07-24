class UniversityDetail {
  String uniName;
  String uniCountry;
  String uniDescription;
  num uniEvaluation;
  String uniId;
  String uniImg;

  UniversityDetail({
      this.uniId,
      this.uniName,
      this.uniCountry,
      this.uniDescription,
      this.uniEvaluation,
      this.uniImg,
      });


  UniversityDetail.fromMap(Map snapshot, String id):

    uniId = id ?? '',
    uniName = snapshot['uniName'] ?? '',
    uniCountry = snapshot['uniCountry'] ?? '',
    uniDescription = snapshot['uniDescription'] ?? '',
    uniEvaluation = snapshot['uniEvaluation'] ?? '',
    uniImg = snapshot['uniImg'] ?? '';
  toJson() {
    return {
      "uniId": uniId,
      "uniName": uniName,
      "uniCountry": uniCountry,
      "uniDescription": uniDescription,
      "uniEvaluation": uniEvaluation,
      "uniImg": uniImg,
    };
  }
}
