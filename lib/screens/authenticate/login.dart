import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.Services/auth.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   backgroundColor: Colors.lightBlue[900],
            //   title: Text('Login Page'),
            // ),
            body: Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage("img/login.png"), fit: BoxFit.fill)),
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0, right: 150.0),
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.red[100],
                              fontSize: 35.0,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Georgia')),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 50.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Colors.blue[200], fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: Icon(Icons.email)),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an valid email ' : null,
                        onChanged: (val) {
                          if (val.endsWith(' '))
                            setState(() => email = val.trim());
                          else
                            setState(() => email = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 50.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: ' Password',
                            hintStyle: TextStyle(
                                color: Colors.blue[200], fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter n password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'OR Login with...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0, fontFamily: 'Georgia', height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 170.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue[600],
                          ),
                          Text(
                            '  Facebook',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Georgia',
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 170.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.googlePlus,
                            color: Colors.deepOrange[200],
                          ),
                          Text(
                            '  Google+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Georgia',
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 170.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.lightBlue[400],
                          ),
                          Text(
                            '  Twitter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Georgia',
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170.0),
                      child: RaisedButton(
                        color: Colors.lightBlue[100],
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          '  Login  ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Georgia'),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Invalid email or password';
                                loading = false;
                              });
                            } else {
                              Navigator.of(context)
                                  .pushReplacementNamed("/home");
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
