import 'package:zoda/common/Repository.dart';
import 'package:zoda/models/userDetail.dart';

class UserService {

  Repository _rep = Repository("user");

  final String uid;
  UserService({this.uid});

  Future add(UserDetail data) async {
    return await _rep.addDocument(data.toJson());
  }
}
