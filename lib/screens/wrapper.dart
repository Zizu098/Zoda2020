import 'package:flutter/material.dart';
import 'package:zoda/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:zoda/models/user.dart';

checkIfAuthenticated() async {
  await Future.delayed(Duration(
      seconds: 5)); // could be a long running task, like a fetch from keychain
  return true;
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //returtn either Home or Authenticate
    if (user != null) {
      Future.delayed(Duration(seconds: 2))
          .then((obj) {
            Navigator.of(context).pushReplacementNamed("/home");
            });
    }
    return Authenticate();
  }
}