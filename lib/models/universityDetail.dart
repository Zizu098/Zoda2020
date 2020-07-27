class UniversityDetail {
  String uniName;
  String uniCountry;
  String uniDescription;
  num uniEvaluation;
  String uniId;
  String uniImg;
  num hit;

  UniversityDetail({
      this.uniId,
      this.uniName,
      this.uniCountry,
      this.uniDescription,
      this.uniEvaluation,
      this.uniImg,
      this.hit
      });


  UniversityDetail.fromMap(Map snapshot, String id):

    uniId = id ?? '',
    uniName = snapshot['uniName'] ?? '',
    uniCountry = snapshot['uniCountry'] ?? '',
    uniDescription = snapshot['uniDescription'] ?? '',
    uniEvaluation = snapshot['uniEvaluation'] ?? 0.0,
    uniImg = snapshot['uniImg'] ?? '',
    hit = snapshot['hit'] ?? 0;
  toJson() {
    return {
      "uniId": uniId,
      "uniName": uniName,
      "uniCountry": uniCountry,
      "uniDescription": uniDescription,
      "uniEvaluation": uniEvaluation,
      "uniImg": uniImg,
      "hit": hit
    };
  }
}
