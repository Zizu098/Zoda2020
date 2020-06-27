import 'package:flutter/cupertino.dart';
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
import 'package:zoda/screens/Home/profile.dart';

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
            onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profile())),
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
            height: 320.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // color: bkColor,
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                     
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
                  height: 30.0,
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
                        splashColor: Colors.yellow[200],
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
                        splashColor: Colors.red[200],
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
                ),
                Text(
                  '\nTOP 10 COUNTRIES',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    
                  ),
                  textAlign: TextAlign.left,
                  
                ),
                Spacer(),
                Icon(Icons.arrow_drop_down,size: 40,color: Colors.lightBlue[200],)
              ],
            ),
          ),
        )
        
      ],
    );
  }
}


class HomeScreenBottomPart extends StatefulWidget {
  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  TextEditingController customController = TextEditingController();

  _createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          
          return CupertinoAlertDialog(
            title: Text("Finland is a Northern Europeean nation bordering Sweden, Norway and Russia. Norway and Russia. Its capital, Helsinki, occupies a peninsula and surrounding islands in the Baltic Sea.Helsinki is home to the 18th-century sea fortress Suomenlinna,the fashionable Design District and diverse museums. The Northern Lights can be seen from the country's Arctic Lapland province, a vast wilderness with national parks and ski resorts."),
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

 List<TopCountriesDetail> locations = [
    TopCountriesDetail(
        url: 'Europe',
        location: 'Finland',
        flag: 'finland.png',
        evaluation: 5,
        description:
            "Finland is a Northern Europeean nation bordering Sweden, Norway and Russia. Its capital, Helsinki, occupies a peninsula and surrounding islands in the Baltic Sea. Helsinki is home to the 18th-century sea fortress Suomenlinna, the fashionable Design District and diverse museums. The Northern Lights can be seen from the country's Arctic Lapland province, a vast wilderness with national parks and ski resorts."),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Austria',
        flag: 'austria.png',
        evaluation: 5,
        description:
            "Austria, officially the Republic of Austria, is a landlocked East Alpine country in the southern part of Central Europee. It is composed of nine federated states, one of which is Vienna, Austria's capital and its largest city"),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Canada',
        flag: 'canada.png',
        evaluation: 5,
        description:
            "Canada is a country in the northern part of North America. Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country by total area"),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Denmark',
        flag: 'denmark.png',
        evaluation: 5,
        description:
            "Denmark is a Scandinavian country comprising the Jutland Peninsula and numerous islands. It's linked to nearby Sweden via the Öresund bridge. Copenhagen, its capital, is home to royal palaces and colorful Nyhavn harbor, plus the Tivoli amusement park and the iconic “Little Mermaid” statue. Odense is writer Hans Christian Andersen’s hometown, with a medieval core of cobbled streets and half-timbered houses."),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Iceland',
        flag: 'iceland.png',
        evaluation: 4,
        description:
            "Iceland, a Nordic island nation, is defined by its dramatic landscape with volcanoes, geysers, hot springs and lava fields. Massive glaciers are protected in Vatnajökull and Snæfellsjökull national parks. Most of the population lives in the capital, Reykjavik, which runs on geothermal power and is home to the National and Saga museums, tracing Iceland’s Viking history."),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Netherlands',
        flag: 'netherlands.png',
        evaluation: 4,
        description:
            '"The Netherlands, a country in northwestern Europee, is known for a flat landscape of canals, tulip fields, windmills and cycling routes. Amsterdam, the capital, is home to the Rijksmuseum, Van Gogh Museum and the house where Jewish diarist Anne Frank hid during WWII. Canalside mansions and a trove of works from artists including Rembrandt and Vermeer remain from the citys 17th-century "Golden Age."'),
    TopCountriesDetail(
        url: 'Europe',
        location: 'New Zealand',
        flag: 'new zealand.png',
        evaluation: 4,
        description:
            "New Zealand is an island country in the southwestern Pacific Ocean. It comprises two main landmasses—the North Island and the South Island —and around 600 smaller islands, covering a total area of 268,021 square kilometres"),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Norway',
        flag: 'norway.png',
        evaluation: 3,
        description:
            "Norway is a Scandinavian country encompassing mountains, glaciers and deep coastal fjords. Oslo, the capital, is a city of green spaces and museums. Preserved 9th-century Viking ships are displayed at Oslo’s Viking Ship Museum. Bergen, with colorful wooden houses, is the starting point for cruises to the dramatic Sognefjord. Norway is also known for fishing, hiking and skiing, notably at Lillehammer’s Olympic resort."),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Sweden',
        flag: 'sweden.png',
        evaluation: 3,
        description:
            "Sweden is a Scandinavian nation with thousands of coastal islands and inland lakes, along with vast boreal forests and glaciated mountains. Its principal cities, eastern capital Stockholm and southwestern Gothenburg and Malmö, are all coastal. Stockholm is built on 14 islands. It has more than 50 bridges, as well as the medieval old town, Gamla Stan, royal palaces and museums such as open-air Skansen."),
    TopCountriesDetail(
        url: 'Europe',
        location: 'Switzerland',
        flag: 'switzerland.png',
        evaluation: 3,
        description:
            "Switzerland is a mountainous Central Europeean country, home to numerous lakes, villages and the high peaks of the Alps. Its cities contain medieval quarters, with landmarks like capital Bern’s Zytglogge clock tower and Lucerne’s wooden chapel bridge. The country is also known for its ski resorts and hiking trails. Banking and finance are key industries, and Swiss watches and chocolate are world renowned."),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 35),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('img/${locations[index].flag}'),
                      backgroundColor: Colors.black,
                      radius: 20,
                    ),
                    Text(
                      '   ' + locations[index].location,
                      style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                        letterSpacing: 2,),
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
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      
                      Text(
                        locations[index].evaluation.toString(),
                        style: new TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _createAlertDialog(context);
                        },
                        icon: Icon(Icons.info_outline),color: Colors.blue[700],
                        iconSize: 35,
                        splashColor: Colors.lightBlue,
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
