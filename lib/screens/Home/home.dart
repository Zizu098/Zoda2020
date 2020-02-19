import 'package:flutter/material.dart';
import 'package:zoda/database.Services/auth.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Home extends StatelessWidget {

final List<Slide> slides = new List();
final AuthService _auth = AuthService();

    Home() {
      slides.add(
        new Slide(
          title: "Welcome", 
          styleDescription: TextStyle(fontSize: 30.0,color: Color(0xff16071e)),
          styleTitle: TextStyle(color: Color(0xfff9811e), fontSize: 40.0,fontWeight: FontWeight.bold),
          description: "Welcome to our app! GEARS FOR GEARS (G4G).",
          backgroundColor: Colors.white
        ),
      );
    slides.add(
      new Slide(
        title: "About Our APP!",
         styleDescription: TextStyle(fontSize: 30.0,color: Color(0xff16071e)),
         styleTitle: TextStyle(color: Color(0xfff9811e), fontSize: 40.0,fontWeight: FontWeight.bold),
        description: "We want to take care of your car more than that.",
        backgroundColor: Colors.white
      ),
    );
    slides.add(
      new Slide(
        title: "About Our APP!",
         styleDescription: TextStyle(fontSize: 30.0,color: Color(0xff16071e)),
         styleTitle: TextStyle(color: Color(0xfff9811e), fontSize: 40.0,fontWeight: FontWeight.bold),
        description:
        "Here you can choose best service center for your car by knowing the feedback of other users.",
        backgroundColor: Colors.white
      ),
    );
    slides.add(
      new Slide(
        title: "More About App!",
        description:"You can book through us, wait for us we will comming very soon. ",
        styleDescription: TextStyle(fontSize: 30.0,color: Color(0xff16071e)),
        styleTitle: TextStyle(color: Color(0xfff9811e), fontSize: 40.0,fontWeight: FontWeight.bold),
        backgroundColor: Colors.white
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geers for Geers'),
        backgroundColor: Color(0xff16071e),
      ),
      drawer: Drawer(
        child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color(0xff16071e),
            child: Center(child: Column(children: <Widget>[
              Container(
                width: 75,
                height: 75,
                margin: EdgeInsets.fromLTRB(0,18,0,5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: 
                  NetworkImage('https://scontent.faly3-1.fna.fbcdn.net/v/t1.0-9/p960x960/84387413_3463413623731310_2162071027679494144_o.jpg?_nc_cat=106&_nc_ohc=WgwzqITnfdsAX-OMZCJ&_nc_ht=scontent.faly3-1.fna&_nc_tp=6&oh=4a70a6af6352f04e49b17df024578409&oe=5ED2581D'))
                ),
              ),
              Text('Zakaria El-Hassan Zakaria', style: TextStyle(fontSize: 16, color: Colors.white),)
            ],),),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile', style: TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact us', style: TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign out', style: TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),),
            onTap: (){
              _auth.signOut();
              Navigator.of(context).pushReplacementNamed("/");  
            },
          ),
        ],)
      ),
      body: new IntroSlider(
      backgroundColorAllSlides: Colors.white,
      slides: this.slides,
      colorSkipBtn: Color(0xff16071e),
      highlightColorSkipBtn: Color(0xff000000),

      colorDoneBtn: Color(0xff16071e),
      highlightColorDoneBtn: Color(0xff000000),
      onDonePress: (){
        // _auth.signOut();
        // Navigator.of(context).pushReplacementNamed("/");
      },

      // colorDot: Color(0xff03003f),
      colorActiveDot: Color(0xff03003f),
      sizeDot: 10.0,
    ),
    );
  }
}