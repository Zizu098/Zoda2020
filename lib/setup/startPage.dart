import 'package:flutter/material.dart';
import 'signIn.dart';
import 'signUp.dart';

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 0,
            ),
            Image(
              image: AssetImage('images/gp_logo.jpg'),
            ),
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              'Join us now',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.red),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 35, 35, 40),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    splashColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.white,
                    color: Colors.redAccent,
//                    colorBrightness: Brightness.dark,
//                    disabledColor: Colors.blueGrey,
//                    highlightColor: Colors.red,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 15, 40),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    splashColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ],
        )
//          Row(
//            children: <Widget>[
//              Center(
//                child: RaisedButton(
//                  onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => LoginPage()));
//                  },
//                  child: Text('Sign in'),
//                ),
//              ),
//              Center(
//                child: RaisedButton(
//                  child: Text('Sign up'),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
        );
  }
}
