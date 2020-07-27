import 'package:flutter/cupertino.dart';
import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/universityDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UniversityService{

  Repository _rep = Repository("university");
  final String uniId;
  List<UniversityDetail> topCountries;

    final db = Firestore.instance.collection("university");


  UniversityService({this.uniId});

  Future addUniversity(UniversityDetail data) async {
     return await _rep.addDocument(data.toJson());
  }
  
  Future <List<UniversityDetail>> fetchData() async {
    var result = await _rep.getDataCollection();
    topCountries = result.documents.map((doc)=> UniversityDetail.fromMap(doc.data, doc.documentID)).toList();
    return topCountries;
  }
  Future<void> removeDocument(String id) async{
     return await _rep.removeDocument(id);
  }
  Future update(UniversityDetail data , String uniId) async{
    return await _rep.updateDocument(data.toJson(), uniId);
  }
  Future<UniversityDetail> getById(String uniId)async {
    var result =  await db.where("uniId",isEqualTo: uniId).getDocuments();
    var university = result.documents.first;
    return UniversityDetail.fromMap(university.data, university.documentID);
  }
  
}
