import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.services/auth.dart';
import 'package:zoda/database.services/topCountries.service.dart';
import 'package:zoda/models/topCountriesDetail.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/studentHome.dart';
import 'package:zoda/database.services/user.service.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:zoda/screens/Home/profile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:firebase_auth/firebase_auth.dart';

var bkColor = Colors.white;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService _userServ = new UserService();
  final AuthService _auth = AuthService();
  UserDetail user = new UserDetail();
  List<UserDetail> u, c;

  var url;

  bool infoWindowVisible = false;
  bool status = false;
  String userId;
  Future<void> getUser() async {
    // setState(() async {
    //   u = await userServ.fetchData();
    //   // c = await _auth.currentUSer();
    //   user = u.first;
    //   final ref = FirebaseStorage.instance.ref().child(user.imgUrl);
    //   url = await ref.getDownloadURL();
    // });
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      userId = userData.uid;
      //user = _userService.getById(userId);
    });
    _userServ.getById(userId).then((value) => {
          this.setState(() {
            user = value;
          }),
          print(user)
        });
  }

  void initState() {
    getUser();
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
    if (user == null) return Loading();
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('ZODA'),
          backgroundColor: Colors.lightBlue[100],
        ),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.lightBlue[200],
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.fromLTRB(0, 18, 0, 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                                  image: NetworkImage('${user.imgUrl}')) ??
                              DecorationImage(image: AssetImage('img/Z.png'))),
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
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
              ),
              onTap: () => Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Profile())),
            ),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text(
            //     'Settings',
            //     style:
            //         TextStyle(fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
            //   ),
            //   onTap: () {
            //     infoWindowVisible = false;
            //     createSettingsPopUp(context);
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Contact us',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
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
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(50, 51, 53, 1)),
              ),
              onTap: () {
                _auth.signOut();
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
          ],
        )),
        body:  
              ListView(
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart(),
          ],
        ),
            
          
          
        
        );
  }
}

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 18.0);

Color firstColor = Colors.lightBlue[900];
Color secondColor = Colors.lightBlue[700];

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
    return Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("img/home.jpg"),
                  fit: BoxFit.fill,
                  repeat: ImageRepeat.noRepeat)),
          child: Column(
            children: [
              SizedBox(height: 150.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        'Our application serves high\nschool diploma holders to \nobtain Scholarships available in\nthe following gields : ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Georgia',
                            color: Colors.blue[400])),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                        'engineering - medicine field \n Political Science - Business',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Georgia',
                            color: Colors.blue[800])),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text('take a look to \n our Scholarships',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Georgia',
                            color: Colors.red[200])),
                  ),
                  Icon(
                    Icons.subdirectory_arrow_right,
                    size: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentHome()));
                      },
                      iconSize: 95.0,
                      color: Colors.lightBlue[100],
                      icon: Icon(FontAwesomeIcons.bookOpen)),
                ],
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Text('Top 10 Counntries : \n',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Georgia',
                              color: Colors.lightBlue[400])),
                )])
            ]
          )
            
    );
            
              
  }
}

class HomeScreenBottomPart extends StatefulWidget {
  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  TextEditingController customController = TextEditingController();
  TopCountriesService fetchTopData = new TopCountriesService();
  List<TopCountriesDetail> location;
  Future<List<TopCountriesDetail>> _fetchTopData() async {
    location = await fetchTopData.fetchData();
    setState(() {
      if (location == null) Loading();
    });
  }

  void initState() {
    _fetchTopData();
  }

  _createAlertDialog(BuildContext context, String description) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(description),
            actions: [
              CupertinoDialogAction(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(customController);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("img/homebotton.jpg"),
                  fit: BoxFit.fill,
                  repeat: ImageRepeat.noRepeat)),
      child: new ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: (location != null) ? location.length : 10,
          itemBuilder: (BuildContext context, int index) =>
              _buildTripCard(context, index)),
    );
  }

  Widget _buildTripCard(BuildContext context, int index) {
    return new Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right:20.0, left: 20.0),
            child: Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 35),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: (location == null)
                                ? AssetImage('img/Z.png')
                                : AssetImage('${location[index].topCountriesImage}'),
                            backgroundColor: Colors.black,
                            radius: 20,
                          ),
                          Text(
                            '  ' + location[index].topCountriesName,
                            style: new TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[800],
                              letterSpacing: 2,
                            ),
                          ),
                          Spacer(),
                          // Text(
                          //   location[index].topCountriesContinent,
                          //   style: new TextStyle(fontSize: 15),
                          // ),
                        ],
                      ),
                    ),
                    
                     Row(
                          children: <Widget>[
                            SmoothStarRating(
                              rating:
                                  location[index].topCountriesEvaluation.toDouble(),
                              isReadOnly: true,
                              size: 20,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 2.0,
                              onRated: null,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                _createAlertDialog(
                                    context, location[index].topCountriesDescription);
                              },
                              icon: Icon(Icons.info_outline),
                              color: Colors.blue[700],
                              iconSize: 35,
                              splashColor: Colors.lightBlue,
                            ),
                          ],
                        )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
