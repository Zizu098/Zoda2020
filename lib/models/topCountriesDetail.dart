
class TopCountriesDetail {
  String url;
  String location;
  String flag;
  double evaluation;
  // String topCountriesImage;
  String description;
 

  TopCountriesDetail({
      this.url,
      this.location,
      this.flag,
      this.evaluation,
      // this.topCountriesImage,
      this.description
      });


  TopCountriesDetail.fromMap(Map snapshot, String id):

    url = 'id' ?? 0,
    location = snapshot['location'] ?? '',
    flag = snapshot['flag'] ?? '',
    evaluation = snapshot['evaluation'] ?? 0,
    // topCountriesImage = snapshot['topCountriesImage'] ?? '',
    description = snapshot['description'] ?? '';


  toJson() {
    return {
      "url": url,
      "location": location,
      "flag": flag,
      "evaluation": evaluation,
      // "topCountriesImage": topCountriesImage,
      "description": description
  };
}
}