import 'package:flutter/material.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.Services/auth.dart';
import 'package:zoda/theme/input.dart';

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
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        // elevation: 0.0,
        title: Text('Login Page'),
        
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 10.0,
              ),
               Image(
              image: AssetImage("img/GearWithTitle.png"),
              width: 100.0,
            ),
            SizedBox(
                height: 45.0,
              ),

              TextFormField(

                decoration:textInputDecoration.copyWith(hintText: 'Email', icon: Icon(Icons.person)), 
                
                validator: (val) => val.isEmpty ? 'Enter an valid email ': null,
                onChanged: (val) {
                  if(val.endsWith(' '))
                    setState(() => email = val.trim());
                  else
                    setState(() => email = val);  
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: 'Password',icon: Icon(Icons.lock)),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter n password 6+ chars long': null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.lightBlue[900],
                 padding: const EdgeInsets.all(10.0),
                 shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
                child: Text(
                  '  Login  ',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                         error = 'Invalid email or password';
                         loading = false;
                      });
                    }
                    else{
                      Navigator.of(context).pushReplacementNamed("/home");
                    } 
                  }
                },
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