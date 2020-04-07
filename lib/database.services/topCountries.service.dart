import 'package:flutter/cupertino.dart';
import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/topCountriesDetail.dart';

class TopCountriesService{

  Repository _rep = Repository("top countries");
  final String topCountriesId;
  List<TopCountriesDetail> topCountries;

  TopCountriesService({this.topCountriesId});

  Future addTopCountries(TopCountriesDetail data) async {
     return await _rep.addDocument(data.toJson());
  }
  
  Future <List<TopCountriesDetail>> fetchData() async {
    var result = await _rep.getDataCollection();
    topCountries = result.documents.map((doc)=> TopCountriesDetail.fromMap(doc.data, doc.documentID)).toList();
    return topCountries;
  }
  
  
}
