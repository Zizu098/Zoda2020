class NationDetail {
  String nationName;
  String nationContinent;
  String nationDescription;
  num nationEvaluation;
  String nationId;
  String nationImg;
  num hit;

  NationDetail({
      this.nationId,
      this.nationName,
      this.nationContinent,
      this.nationDescription,
      this.nationEvaluation,
      this.nationImg,
      this.hit
      });


  NationDetail.fromMap(Map snapshot, String id):

    nationId = id ?? '',
    nationName = snapshot['nationName'] ?? '',
    nationContinent = snapshot['nationContinent'] ?? '',
    nationDescription = snapshot['nationDescription'] ?? '',
    nationEvaluation = snapshot['nationEvaluation'] ?? 0.0,
    nationImg = snapshot['nationImg'] ?? '',
    hit = snapshot['hit'] ?? 0;
  toJson() {
    return {
      "nationId": nationId,
      "nationName": nationName,
      "nationContinent": nationContinent,
      "nationDescription": nationDescription,
      "nationEvaluation": nationEvaluation,
      "nationImg": nationImg,
       "hit": hit,
    };
  }
}
