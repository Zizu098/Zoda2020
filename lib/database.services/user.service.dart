import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/user.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {

  Repository _rep = Repository("user");

  final String uid;
  List<UserDetail> users;
  UserService({this.uid});

  Future add(UserDetail data) async {
    // const url = 'https://migration-f709e.firebaseio.com/users.json';
    // http.post(url, body: json.encode({
    //   'firstName' : data.firstName,
    //   'lastName' : data.lastName,
    //   'address' : data.address,
    //   'age' : data.age,
    //   'phone' : data.phone,
    //   'email' : data.email
    // }),); 
    return await _rep.addDocument(data.toJson());
  }

  Future <List<UserDetail>> fetchData() async {
    var result = await _rep.getDataCollection();
    users = result.documents.map((doc)=> UserDetail.fromMap(doc.data, doc.documentID)).toList();
    return users;
  }
}
