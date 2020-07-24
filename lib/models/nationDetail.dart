class NationDetail {
  String nationName;
  String nationContinent;
  String nationDescription;
  num nationEvaluation;
  String nationId;
  String nationImg;

  NationDetail({
      this.nationId,
      this.nationName,
      this.nationContinent,
      this.nationDescription,
      this.nationEvaluation,
      this.nationImg,
      });


  NationDetail.fromMap(Map snapshot, String id):

    nationId = id ?? '',
    nationName = snapshot['nationName'] ?? '',
    nationContinent = snapshot['nationContinent'] ?? '',
    nationDescription = snapshot['nationDescription'] ?? '',
    nationEvaluation = snapshot['nationEvaluation'] ?? '',
    nationImg = snapshot['nationImg'] ?? '';
  toJson() {
    return {
      "nationId": nationId,
      "nationName": nationName,
      "nationContinent": nationContinent,
      "nationDescription": nationDescription,
      "nationEvaluation": nationEvaluation,
      "nationImg": nationImg,
    };
  }
}
