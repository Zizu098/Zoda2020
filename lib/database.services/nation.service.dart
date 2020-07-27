import 'package:flutter/cupertino.dart';
import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/nationDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NationService{

  Repository _rep = Repository("nation");
   final db = Firestore.instance.collection("nation");
  final String nationId;
  List<NationDetail> topCountries;

  NationService({this.nationId});

  Future addNation(NationDetail data) async {
     return await _rep.addDocument(data.toJson());
  }
  Future<NationDetail> getById(String nationId)async {
    var result =  await db.where("nationId",isEqualTo: nationId).getDocuments();
    var nation = result.documents.first;
    return NationDetail.fromMap(nation.data, nation.documentID);
  }
  Future <List<NationDetail>> fetchData() async {
    var result = await _rep.getDataCollection();
    topCountries = result.documents.map((doc)=> NationDetail.fromMap(doc.data, doc.documentID)).toList();
    return topCountries;
  }
  Future<void> removeDocument(String id) async{
     return await _rep.removeDocument(id);
  }
  Future update(NationDetail data , String nationId) async{
    return await _rep.updateDocument(data.toJson(), nationId);
  }
  
}
