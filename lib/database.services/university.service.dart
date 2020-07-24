import 'package:flutter/cupertino.dart';
import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/universityDetail.dart';

class UniversityService{

  Repository _rep = Repository("university");
  final String uniId;
  List<UniversityDetail> topCountries;

  UniversityService({this.uniId});

  Future addUniversity(UniversityDetail data) async {
     return await _rep.addDocument(data.toJson());
  }
  
  Future <List<UniversityDetail>> fetchData() async {
    var result = await _rep.getDataCollection();
    topCountries = result.documents.map((doc)=> UniversityDetail.fromMap(doc.data, doc.documentID)).toList();
    return topCountries;
  }
  
  
}
