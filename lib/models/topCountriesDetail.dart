
class TopCountriesDetail {
  String topCountriesContinent;
  String topCountriesName;
  String topCountriesImage;
  num topCountriesEvaluation;
  // String topCountriesId;
  String topCountriesDescription;
 

  TopCountriesDetail({
      this.topCountriesContinent,
      this.topCountriesName,
      this.topCountriesImage,
      // this.topCountriesEvaluation,
      // this.topCountriesId,
      this.topCountriesDescription
      });


  TopCountriesDetail.fromMap(Map snapshot, String id):

    topCountriesContinent = snapshot['topCountriesContinent'] ?? '',
    topCountriesName = snapshot['topCountriesName'] ?? '',
    topCountriesImage = snapshot['topCountriesImage'] ?? '',
    topCountriesEvaluation = snapshot['topCountriesEvaluation'] ?? 0.0,
    // topCountriesId = snapshot['topCountriesId'] ?? '',
    topCountriesDescription = snapshot['topCountriesDescription'] ?? '';


  toJson() {
    return {
      "topCountriesContinent": topCountriesContinent,
      "topCountriesName": topCountriesName,
      "topCountriesImage": topCountriesImage,
      "topCountriesEvaluation": topCountriesEvaluation,
      // "topCountriesId": topCountriesId,
      "topCountriesDescription": topCountriesDescription
  };
}
}