import 'package:flutter/material.dart';
import 'package:zoda/database.services/auth.dart';
import 'package:zoda/models/topCountriesDetail.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/studentHome.dart';
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
      resizeToAvoidBottomPadding: false,
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
      body: ListView(
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
// List<String> locations = ['Cairo (Cai)', 'Alexandria (Alex)'];

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
                  height: 50.0,
                ),

                //search bar
                // Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 32.0),
                //     child:
                //      Material(
                //         elevation: 5.0,
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(30.0),
                //         ),
                //         child: TextField(
                //           controller: TextEditingController(text: locations[0]),
                //           style: dropDownMenuItemStyle,
                //           cursorColor: appTheme.primaryColor,
                //           decoration: InputDecoration(
                //             contentPadding: EdgeInsets.symmetric(
                //                 horizontal: 32.0, vertical: 14.0),
                //             suffix: Material(
                //               elevation: 2.0,
                //               borderRadius: BorderRadius.all(
                //                 Radius.circular(30.0),
                //               ),
                //               child: Icon(
                //                 Icons.search,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             border: InputBorder.none,
                //           ),
                //         ))),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      // Icon(Icons.location_on, color: Colors.white),
                      // SizedBox(
                      //   width: 16.0,
                      // ),
                      // PopupMenuButton(
                      //   onSelected: (index) {
                      //     setState(() {
                      //       selectedLocationIndex = index;
                      //     });
                      //   },
                      //   child: Row(
                      //     children: <Widget>[
                      //       Text(
                      //         locations[selectedLocationIndex],
                      //         style: dropDownLabelStyle,
                      //       ),
                      //       Icon(
                      //         Icons.keyboard_arrow_down,
                      //         color: Colors.white,
                      //       )
                      //     ],
                      //   ),
                      //   itemBuilder: (BuildContext context) =>
                      //       <PopupMenuItem<int>>[
                      //     PopupMenuItem(
                      //       child: Text(locations[0],
                      //           style: dropDownMenuItemStyle),
                      //       value: 0,
                      //     ),
                      //     PopupMenuItem(
                      //       child: Text(locations[1],
                      //           style: dropDownMenuItemStyle),
                      //       value: 1,
                      //     ),
                      //   ],
                      // ),
                      // Spacer(),
                      // Icon(
                      //   Icons.settings,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Where would\nyou want to go?',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40.0,
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                        color: Color(0xfff9811e),
                        splashColor: Colors.red[400],
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
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                        splashColor: Colors.blueAccent[100],
                        color: Color(0xffffceae),
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

// var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);
// ListView listview;
class HomeScreenBottomPart extends StatefulWidget {
  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  final List<TopCountriesDetail> locations = [
    TopCountriesDetail(
        url: 'Europ', location: 'Finland', flag: 'finland.png', evaluation: 5),
    TopCountriesDetail(
        url: 'Europ', location: 'Austria', flag: 'austria.png', evaluation: 5),
    TopCountriesDetail(
        url: 'Europ', location: 'Canada', flag: 'canada.png', evaluation: 5),
    TopCountriesDetail(
        url: 'Europ', location: 'Denmark', flag: 'denmark.png', evaluation: 5),
    TopCountriesDetail(
        url: 'Europ', location: 'Iceland', flag: 'iceland.png', evaluation: 4),
    TopCountriesDetail(
        url: 'Europ',
        location: 'Netherlands',
        flag: 'netherlands.png',
        evaluation: 4),
    TopCountriesDetail(
        url: 'Europ',
        location: 'New Zealand',
        flag: 'new zealand.png',
        evaluation: 4),
    TopCountriesDetail(
        url: 'Europ', location: 'Norway', flag: 'norway.png', evaluation: 3),
    TopCountriesDetail(
        url: 'Europ', location: 'Sweden', flag: 'sweden.png', evaluation: 3),
    TopCountriesDetail(
        url: 'Europ',
        location: 'Switzerland',
        flag: 'switzerland.png',
        evaluation: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: new ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)
              ),
              
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('img/${locations[index].flag}'),
                      backgroundColor: Colors.black,
                      radius: 25,
                      
                    ),
                    Text('   '+
                        locations[index].location ,
                        style: new TextStyle(fontSize: 25),
                      ),
                    Spacer(),
                    Text(
                      locations[index].url,
                      style: new TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   locations[index].location,
                      //   style: new TextStyle(fontSize: 25),
                      // ),
                      Spacer(),
                      Text(
                        locations[index].evaluation.toString(),
                        style: new TextStyle(fontSize: 20),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// return Column(
//   children: <Widget>[
//     ListView.builder(
//       physics: ScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: locations.length,
//         itemBuilder: (context, index) {
//           return Card(
//             // padding:
//             //     const EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0),
//             child: ListTile(
//               title: Text(locations[index].location),
//               leading: CircleAvatar(
//                 backgroundImage: AssetImage('img/${locations[index].flag}'),
//               ),
//             ),
//           );
//         }),
//   ],
// );

// List<TopCountriesDetail> t;

// class _homeScreenBottomPartState extends State<homeScreenBottomPart> {
//   // TopCountriesService topServ = new TopCountriesService();
//   // TopCountriesDetail topCountry = new TopCountriesDetail();
//   // List<TopCountriesDetail> countriesList;
//   // TopCountriesService topServ = new TopCountriesService();
//   // List<Widget> cardList = new List();
//   void getTopCountries() async {
//     setState(() async {
//       // t = await topServ.fetchData();
//     });
//   }

// t.length
// List<Widget> buildCard() {
//   for (int i = 0; i < 10; i++) {
//     cardList.add(new Card(
//       child: ListTile(
//         title: Text('topCountry'),
//       ),
//     ));
//   }
//   return cardList;
// }

// _homeScreenBottomPartState() {
//   topCountry.topCountriesId = 2;
//   topCountry.topCountriesName = 'Denmark';
//   topCountry.topCountriesContinent = 'Europe';
//   topCountry.topCountriesEvaluation = 5.0;
//   topCountry.topCountriesImage = 'img/denmark.png';
//   topCountry.topCountriesDescription =
//       'Denmark is a Scandinavian country comprising the Jutland Peninsula and numerous islands. It\'s linked to nearby Sweden via the Öresund bridge. Copenhagen, its capital, is home to royal palaces and colorful Nyhavn harbor, plus the Tivoli amusement park and the iconic “Little Mermaid” statue. Odense is writer Hans Christian Andersen\’s hometown, with a medieval core of cobbled streets and half-timbered houses.';
// }

//   @override
//   Widget build(BuildContext context) {
//     getTopCountries();
//     buildCard();
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text('Top 10  '),
//           ListView(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             children: cardList,
//           ),

//         ]);
//   }
// }

//
// RaisedButton(
//     color: Color(0xfff9811e),
//     onPressed: () {
//       topServ.addTopCountries(topCountry);
//     },
//     padding: EdgeInsets.all(15.0),
//     shape: new RoundedRectangleBorder(
//         borderRadius: new BorderRadius.circular(30.0)),
//     child: Text(
//       'Add top 10 countries',
//       textAlign: TextAlign.center,
//       style:
//           TextStyle(fontSize: 25.0, fontFamily: 'Georgia', height: 1),
//     ),
//     textColor: Colors.white,
//   ),

// Card(
// // child: Column(
// //   mainAxisSize: MainAxisSize.min,
// //   children: <Widget>[
// //     // Row(
// //     //   children: <Widget>[
// //     ListTile(
// //       // leading: Image(image: AssetImage(topCountry.topCountriesImage)),
// //       title: Text(topCountry.topCountriesName),
// //       subtitle: Text(topCountry.topCountriesContinent),
// //     ),
// //     //   ],
// //     // ),
// //     ButtonBar(
// //       children: <Widget>[
// //         Text(topCountry.topCountriesName),
// //         Text(topCountry.topCountriesContinent),
// //         FlatButton(
// //           child: Text('View'),
// //           onPressed: () {/* ... */},
// //         ),
// //       ],
// //     ),
// //   ],
// // ),
//   ),

// var homeScreenBottomPart =

// List<countryCard> countryCards = [
//   // countryCard("assets/images/map1.png", "North Of America"),
// ];

// class countryCard extends StatefulWidget {
//   @override
//   _countryCardState createState() => _countryCardState();
// }

// class _countryCardState extends State<countryCard> {
//   // final String imagePath, countryName;
//   List<TopCountriesService> allData = [];
//   // countryCard(this.imagePath, this.countryName);
//   void initState() {

//     DatabaseReference ref = FirebaseDatabase.instance.reference();
//     ref.child('TopCountriesService').once().then((DataSnapshot snap) {
//       var keys = snap.value.keys;
//       var data = snap.value;
//       allData.clear();
//       for (var key in keys) {
//         // TopCountriesService c = new TopCountriesService(
//         //   data[key]['name'],
//         //   data[key]['image'],
//         // );
//         // allData.add(c);
//       }
//       setState(() {
//         print('length: ${allData.length}');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//             height: 60.0,
//             width: 40.0,
//             // child: Image.asset(
//             //   imagePath,
//             //   fit: BoxFit.cover,
//             // ),
//             child: allData.length == 0
//                 ? new Text('no data')
//                 : new Text('there is data')),
//       ],
//     );
//   }

//   Widget UI() {
//     return new Card(
//       child: new Container(
//         child: new Column(
//           children: <Widget>[new Text('Name')],
//         ),
//       ),
//     );
//   }
// }
