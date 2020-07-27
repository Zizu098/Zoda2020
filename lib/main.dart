import 'package:flutter/material.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/authenticate/login.dart';
import 'package:zoda/screens/authenticate/register.dart';
import 'package:zoda/screens/wrapper.dart';
import 'package:zoda/database.Services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        initialRoute: "/",
        routes: {
          '/': (BuildContext context) => Wrapper(),
          '/login': (BuildContext context) => Login(),
          '/register': (BuildContext context) => Register(),
          '/home': (BuildContext context) => Home()
        },
      ),
    );
  }
}
