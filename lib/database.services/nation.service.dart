import 'package:flutter/cupertino.dart';
import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/nationDetail.dart';

class NationService{

  Repository _rep = Repository("university");
  final String nationId;
  List<NationDetail> topCountries;

  NationService({this.nationId});

  Future addUniversity(NationDetail data) async {
     return await _rep.addDocument(data.toJson());
  }
  
  Future <List<NationDetail>> fetchData() async {
    var result = await _rep.getDataCollection();
    topCountries = result.documents.map((doc)=> NationDetail.fromMap(doc.data, doc.documentID)).toList();
    return topCountries;
  }
  
  
}
