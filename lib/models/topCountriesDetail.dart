import 'dart:ffi';

class TopCountriesDetail {
  int topCountriesId;
  String topCountriesName;
  String topCountriesContinent;
  double topCountriesEvaluation;
  String topCountriesImage;
  String topCountriesDescription;
 

  TopCountriesDetail({
      this.topCountriesId,
      this.topCountriesName,
      this.topCountriesContinent,
      this.topCountriesEvaluation,
      this.topCountriesImage,
      this.topCountriesDescription
      });


  TopCountriesDetail.fromMap(Map snapshot, String id):

    topCountriesId = id ?? 0,
    topCountriesName = snapshot['topCountriesName'] ?? '',
    topCountriesContinent = snapshot['topCountriesContinent'] ?? '',
    topCountriesEvaluation = snapshot['topCountriesEvaluation'] ?? 0,
    topCountriesImage = snapshot['topCountriesImage'] ?? '',
    topCountriesDescription = snapshot['topCountriesDescription'] ?? '';


  toJson() {
    return {
      "topCountriesId": topCountriesId,
      "topCountriesName": topCountriesName,
      "topCountriesContinent": topCountriesContinent,
      "topCountriesEvaluation": topCountriesEvaluation,
      "topCountriesImage": topCountriesImage,
      "topCountriesDescription": topCountriesDescription
  };
}
}