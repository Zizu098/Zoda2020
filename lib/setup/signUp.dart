import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'signIn.dart';
import 'package:zoda/pages/home.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = new GoogleSignIn();

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RegisterPageState();
}

enum FormType { login, register }

class _RegisterPageState extends State<RegisterPage> {
  final formKey = new GlobalKey<FormState>();   
  String _email;
  String _password;
  FormType _formType = FormType.register;
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          FirebaseUser user = (await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _email, password: _password))
              .user;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          FirebaseUser user = (await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email, password: _password))
              .user;
          print('Registered user: ${user.uid}');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Register'),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text(
            'Login',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Create an account',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
        )
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text(
            'Create an account',
            style: new TextStyle(fontSize: 20.0),
          ),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Have an account? Login',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
