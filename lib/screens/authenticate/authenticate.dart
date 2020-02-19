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
          decoration: new BoxDecoration(color: Colors.white),
          child: Column(children: <Widget>[
            SizedBox(height: 150.0),
            Image(
              image: AssetImage("img/GearWithTitle.png"),
              width: 175.0,
            ),
            SizedBox(height: 15.0),
            Text(
              '"If you in panic get a Mechanic"',
              style: TextStyle(color: Color(0xff16071e), fontSize: 17.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 75.0),
            RaisedButton(
              color: Color(0xfff9811e),
              onPressed: () {
                // Route route =
                //     MaterialPageRoute(builder: (context) => new Register());
                // Navigator.push(context, route);
                Navigator.of(context).pushNamed("/register");
              },
              padding: EdgeInsets.all(15.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: Text(
                'Create a new account',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 25.0, fontFamily: 'Georgia', height: 1),
              ),
              textColor: Colors.white,
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Have an Account? ",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Georgia',
                          color: Color(0xfff9811e)),  
                    ),
                    FlatButton(
                      onPressed: () {
                        print("login pressed");
                        // Route route =
                        //     MaterialPageRoute(builder: (context) => new Login());
                        // Navigator.push(context, route);
                        Navigator.of(context).pushNamed("/login");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 27.0,
                            fontFamily: 'Georgia',
                            color: Color(0xff16071e),
                            fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ])),
    );
  }
}
