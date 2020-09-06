import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("img/auth.jpg"), fit: BoxFit.fill)),
          child: Column(children: <Widget>[
            // SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.only(left:100.0, top: 40.0),
              child: Image(
                image: AssetImage("img/Z.png"),
                width: 400,
              ),
            ),
            Text(
              '"Find your best place"',
              style: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 75.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: RaisedButton(
                    color: Colors.lightBlue[100],
                    onPressed: () {
                      Navigator.of(context).pushNamed("/register");
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Text(
                      'Create account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0, fontFamily: 'Georgia', height: 1),
                    ),
                    textColor: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    fontFamily: 'Georgia',
                    height: 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RaisedButton(
                    color: Colors.lightBlue[100],
                    onPressed: () {
                      Navigator.of(context).pushNamed("/login");
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0, fontFamily: 'Georgia', height: 1),
                    ),
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
            // Expanded(
            //   child: Align(
            //     alignment: FractionalOffset.bottomCenter,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //           "Have an Account? ",
            //           style: TextStyle(
            //               fontSize: 17.0,
            //               fontFamily: 'Georgia',
            //               color: Color(0xfff9811e)),
            //         ),
            //         FlatButton(
            //           onPressed: () {
            //             Navigator.of(context).pushNamed("/login");
            //           },
            //           child: Text(
            //             "Login",
            //             style: TextStyle(
            //                 fontSize: 27.0,
            //                 fontFamily: 'Georgia',
            //                 color: Colors.lightBlue[900],
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            )
          ])),
    );
  }
}
