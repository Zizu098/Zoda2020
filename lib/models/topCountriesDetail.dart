import 'dart:ffi';

class TopCountriesDetail {
  int topCountriesId;
  String topCountriesName;
  String topCountriesContinent;
  Float topCountriesEvaluation;
  String topCountriesImage;
 

  TopCountriesDetail({
      this.topCountriesId,
      this.topCountriesName,
      this.topCountriesContinent,
      this.topCountriesEvaluation,
      this.topCountriesImage,
      });


  TopCountriesDetail.fromMap(Map snapshot, String id):

    topCountriesId = id ?? 0,
    topCountriesName = snapshot['topCountriesName'] ?? '',
    topCountriesContinent = snapshot['topCountriesContinent'] ?? '',
    topCountriesEvaluation = snapshot['topCountriesEvaluation'] ?? 0,
    topCountriesImage = snapshot['topCountriesImage'] ?? '';

  toJson() {
    return {
      "topCountriesId": topCountriesId,
      "topCountriesName": topCountriesName,
      "topCountriesContinent": topCountriesContinent,
      "topCountriesEvaluation": topCountriesEvaluation,
      "topCountriesImage": topCountriesImage,
  };
}
}