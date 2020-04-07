import 'package:flutter/material.dart';
import 'package:zoda/database.services/auth.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/studentHome.dart';
import 'package:zoda/database.services/bestCountries.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:zoda/database.services/user.service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:custom_switch/custom_switch.dart';

var bkColor = Colors.white;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService userServ = new UserService();
  final AuthService _auth = AuthService();
  UserDetail user = new UserDetail();
  List<UserDetail> u, c;
  var url;
  bool infoWindowVisible = false;
  bool status = false;
  // _HomeState(){

  // }

  //   void getUser() async{
  //   userServ.fetchData().then((u) {
  //     setState(() {
  //       user = u.firstWhere((s) => s.phone == '01091477247');
  //     });
  //   });
  // }

  void getUser() async {
    setState(() async {
      u = await userServ.fetchData();
      // c = await _auth.currentUSer();
      user = u.first;
      final ref = FirebaseStorage.instance.ref().child(user.imgUrl);
      url = await ref.getDownloadURL();
    });
  }

  createContactPopUp(BuildContext context) {
    // TextEditingController customController = TextEditingController();
    if (!infoWindowVisible) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Contact us'),
              content: Text('+20 0109 1477 247'),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Ok'),
                  onPressed: () {
                    setState(() {
                      infoWindowVisible = true;
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            );
          });
    }
  }

  createSettingsPopUp(BuildContext context) {
    // TextEditingController customController = TextEditingController();
    if (!infoWindowVisible) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Settings'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Dark mode'),
                  // SizedBox(width: 25.0,),
                  CustomSwitch(
                    activeColor: Colors.black,
                    value: status,
                    onChanged: (value) {
                      // print("VALUE : $value");
                      setState(() {
                        status = value;
                        if (status) {
                          bkColor = Colors.black;
                        } else {
                          bkColor = Colors.white;
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Ok'),
                  onPressed: () {
                    setState(() {
                      infoWindowVisible = true;
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ZODA'),
        backgroundColor: Colors.lightBlue[900],
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.lightBlue[900],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    margin: EdgeInsets.fromLTRB(0, 18, 0, 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage('$url'))),
                  ),
                  Text(
                    this.user.email ?? "wait email data.",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
            ),
            onTap: () {
              infoWindowVisible = false;
              createSettingsPopUp(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              'Contact us',
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
            ),
            onTap: () {
              setState(() {
                infoWindowVisible = false;
                createContactPopUp(context);
              });
            },
            // onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Sign out',
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
            ),
            onTap: () {
              _auth.signOut();
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      )),
      body: (Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart(),
        ],
      )),
    );
  }
}

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 18.0);

Color firstColor = Colors.lightBlue[900];
Color secondColor = Colors.lightBlue[700];
List<String> locations = ['Cairo (Cai)', 'Alexandria (Alex)'];

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFF3791A),
);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;
  // UserDetail userData = new UserDetail();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          // clipper: CustomShapeClipper(),
          child: Container(
            height: 350.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // color: bkColor,
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: TextField(
                          controller: TextEditingController(text: locations[0]),
                          style: dropDownMenuItemStyle,
                          cursorColor: appTheme.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 14.0),
                            suffix: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationIndex],
                              style: dropDownLabelStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0],
                                style: dropDownMenuItemStyle),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1],
                                style: dropDownMenuItemStyle),
                            value: 1,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Where would\nyou want to go?',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: FlatButton(
                        color: Color(0xfff9811e),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => studentHome()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.school),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text("Scholarship")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      child: FlatButton(
                        color: Color(0xff1d1f33),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => migrationHome()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.flight_takeoff),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text("Migration")
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

class homeScreenBottomPart extends StatefulWidget {
  @override
  _homeScreenBottomPartState createState() => _homeScreenBottomPartState();
}

class _homeScreenBottomPartState extends State<homeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: bkColor),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Top 10 Countries",
                  style: dropDownMenuItemStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 65,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: countryCards,
            ),
          )
        ],
      ),
    );
  }
}
// var homeScreenBottomPart =

List<countryCard> countryCards = [
  // countryCard("assets/images/map1.png", "North Of America"),
];

class countryCard extends StatefulWidget {
  @override
  _countryCardState createState() => _countryCardState();
}

class _countryCardState extends State<countryCard> {
  // final String imagePath, countryName;
  List<bestCountries> allData = [];
  // countryCard(this.imagePath, this.countryName);
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('bestCountries').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        bestCountries c = new bestCountries(
          data[key]['name'],
          data[key]['image'],
        );
        allData.add(c);
      }
      setState(() {
        print('length: ${allData.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: 60.0,
            width: 40.0,
            // child: Image.asset(
            //   imagePath,
            //   fit: BoxFit.cover,
            // ),
            child: allData.length == 0
                ? new Text('no data')
                : new Text('there is data')),
      ],
    );
  }

  Widget UI() {
    return new Card(
      child: new Container(
        child: new Column(
          children: <Widget>[new Text('Name')],
        ),
      ),
    );
  }
}
