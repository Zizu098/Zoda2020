import 'package:flutter/material.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/student/studentHome.dart';

class MigrationHome extends StatefulWidget {
  MigrationHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MigrationHomeState createState() => _MigrationHomeState();
}

class _MigrationHomeState extends State<MigrationHome>{
  
  Container MyCard(String imageVal, String nameUniv, String country) {
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
            ListTile(
              title: Text(nameUniv),
              subtitle: Text(country),
            ),
            // IconButton(icon: Icon(Icons.account_balance), onPressed: null)
          ],
        ),
      ),
    );
  }
  
  int _selectedIndex = 2;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      _selectedIndex = 2;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else if (_selectedIndex == 0) {
      _selectedIndex = 2;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StudentHome()));
    }
  }


 
  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('ZODA'),
        backgroundColor: Colors.amber[500],
      ),
        body:Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 180,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            MyCard('https://www.nordlys.info/studenter/manedens-universitet/au89.jpg', 'Aarhus University', 'Denmark'),
            MyCard('https://static.accessmba.com/application/public/cache/80411b63c045b9cb055bce91a4e567f8.jpg', 'Geneva University', 'Switzerland'),
            MyCard('https://scholarship-positions.com/wp-content/uploads/2016/12/University-of-Helsinki-Scholarships-for-Non-EUEEA-Students-in-Finland-1024x620.jpg', 'Helsinki University', 'Finland'),
            MyCard('https://www.turku.fi/sites/default/files/styles/opengraph/public/thumbnails/image/turun-yliopisto-paarakennus.jpg?itok=LU4YQGrP', 'Turku University', 'Finland'),
            MyCard('https://www.unak.is/static/files/Myndir/Haskolasvaedid/ha28a-nanne-springer.jpg', 'Akureyri University', 'Iceland'),
            MyCard('https://guidetoiceland.imgix.net/389524/x/0/the-historical-holar-in-hjaltadalur-the-episcopal-see-and-nyibaer-turf-house-in-north-iceland-1?auto=compress%2Cformat&ch=Width%2CDPR&dpr=1&ixlib=php-3.1.0&w=883&s=cd19590d46456cfbe4462afc03a2d924', 'Hólar  University', 'Iceland'),
          
          ],
        ),
      ),     
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flight),
              title: Text('Migration'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[500],
          onTap: _onItemTapped,
        ),
      );
  }
}

// static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];
// static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //  List<DropdownMenuItem<String>> listDrop = [];
  // String selected = null;
  // List<String> drop = [
  //   'Europ',
  //   'North America',
  //   'South America',
  //   'Asturalia',
  //   'Ashia',
  //   'Africa'
  // ];
  // List<DropdownMenuItem<String>> listed = [];
  // String select = null;
  // List<String> droping = [
  //   'Russia',
  //   'USA',
  //   'Canada',
  //   'Asturalia',
  //   'Japan',
  //   'Germany',
  //   'Suezland',
  //   'Nutherland',
  //   'Italy',
  //   'United Kingdom',
  //   'Turkey',
  // ];
  // final dio = new Dio(); // for http requests

  // void loadData() {
  //   listDrop = [];
  //   listDrop = drop
  //       .map((val) => DropdownMenuItem(
  //             child: SizedBox(
  //               width: 150.0, // for example
  //               child: Text(val, textAlign: TextAlign.center),
  //             ),
  //             value: val,
  //           ))
  //       .toList();
  // }

  // void load() {
  //   listed = [];
  //   listed = droping
  //       .map((valu) => DropdownMenuItem(
  //             child: SizedBox(
  //               width: 150.0, // for example
  //               child: Text(valu, textAlign: TextAlign.center),
  //             ),
  //             value: valu,
  //           ))
  //       .toList();
  // }

  // void _searchPressed() {
  //   setState(() {
  //     if (this._searchIcon.icon == Icons.search) {
  //       this._searchIcon = new Icon(Icons.close);
  //       this._appBarTitle = new TextField(
  //         decoration: new InputDecoration(
  //             prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
  //       );
  //     } else {
  //       this._searchIcon = new Icon(Icons.search);
  //       this._appBarTitle = new Text('Search Example');
  //     }
  //   });
  // }
// Widget myDetailsContainer1() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             "Canada",
//             style: TextStyle(
//                 color: Color(0xffe6020a),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   child: Text(
//                 "4.3",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStarHalf,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//             ],
//           )),
//         ),
//         Container(
//             child: Text(
//           "",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }

//   Widget myDetailsContainer2() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             "Australia",
//             style: TextStyle(
//                 color: Color(0xffe6020a),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   child: Text(
//                 "4.3",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStarHalf,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//             ],
//           )),
//         ),
//         Container(
//             child: Text(
//           "",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }

//   Widget myDetailsContainer3() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             "Russia",
//             style: TextStyle(
//                 color: Color(0xffe6020a),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   child: Text(
//                 "4.3",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStarHalf,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//             ],
//           )),
//         ),
//         Container(
//             child: Text(
//           "",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }

//   Widget myDetailsContainer4() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             "USA",
//             style: TextStyle(
//                 color: Color(0xffe6020a),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   child: Text(
//                 "4.3",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStarHalf,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//             ],
//           )),
//         ),
//         Container(
//             child: Text(
//           "",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }

//   Widget myDetailsContainer5() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             "Newzealand",
//             style: TextStyle(
//                 color: Color(0xffe6020a),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   child: Text(
//                 "4.3",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStarHalf,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//             ],
//           )),
//         ),
//         Container(
//             child: Text(
//           "",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }

//   Widget myDetailsContainer6() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             "England",
//             style: TextStyle(
//                 color: Color(0xffe6020a),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                   child: Text(
//                 "4.3",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStar,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                 child: Icon(
//                   FontAwesomeIcons.solidStarHalf,
//                   color: Colors.amber,
//                   size: 15.0,
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               )),
//             ],
//           )),
//         ),
//         Container(
//             child: Text(
//           "",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }
 // body: ListView(
        //   scrollDirection: Axis.vertical,
        //   children: <Widget>[
        //     Container(
        //       child: Center(
        //         child: DropdownButtonHideUnderline(
        //           child: DropdownButton(
        //             items: listDrop,
        //             value: selected,
        //             iconSize: 40.0,
        //             elevation: 1,
        //             style: new TextStyle(
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold,
        //             ),
        //             icon: new Icon(Icons.arrow_drop_down, color: Colors.white),
        //             hint: Text(
        //               'Select feild',
        //               style: TextStyle(
        //                   fontSize: 15.0, fontWeight: FontWeight.bold),
        //             ),
        //             onChanged: (value) {
        //               selected = value;
        //               setState(() {});
        //             },
        //           ),
        //         ),
        //       ),
        //       margin: EdgeInsets.symmetric(
        //         vertical: 10,
        //         horizontal: 15,
        //       ),
        //       width: 150.0,
        //       decoration: BoxDecoration(
        //         color: Colors.red,
        //         border: Border.all(
        //           color: Colors.red[100],
        //           width: 2,
        //         ),
        //         borderRadius: BorderRadius.circular(24.0),
        //       ),
        //     ),
        //     Column(
        //       children: <Widget>[
        //         Container(
        //           child: DropdownButtonHideUnderline(
        //             child: DropdownButton(
        //               items: listed,
        //               value: select,
        //               iconSize: 40.0,
        //               elevation: 1,
        //               style: new TextStyle(
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //               icon:
        //                   new Icon(Icons.arrow_drop_down, color: Colors.white),
        //               hint: Text(
        //                 'Select Country',
        //                 style: TextStyle(
        //                     fontSize: 15.0, fontWeight: FontWeight.bold),
        //               ),
        //               onChanged: (value) {
        //                 select = value;

        //                 switch (value) {
        //                   case "Russia":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "USA":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Canada":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Asturalia":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Japan":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Germany":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Suezland":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Nutherland":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Italy":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "United Kingdom":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                   case "Turkey":
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => SecondScreen()),
        //                     );
        //                     break;
        //                 }
        //               },
        //             ),
        //           ),
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //             border: Border.all(
        //               color: Colors.red[100],
        //               width: 2,
        //             ),
        //             borderRadius: BorderRadius.circular(24.0),
        //           ),
        //         ),
        //       ],
        //     ),
        //     Text(
        //       "Recomended",
        //       style: TextStyle(
        //         fontSize: 20.0,
        //         fontWeight: FontWeight.bold,
        //       ),
        //       textAlign: TextAlign.left,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Container(
        //         alignment: AlignmentDirectional(0.3, 5.0),
        //         height: 240.0,
        //         child: FittedBox(
        //           child: Material(
        //             color: Colors.white,
        //             elevation: 14.0,
        //             borderRadius: BorderRadius.circular(24.0),
        //             shadowColor: Color(0x802196f3),
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(24.0),
        //                     child: Image(
        //                       image: NetworkImage(
        //                           "https://images.unsplash.com/photo-1490623970972-ae8bb3da443e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80"),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 16.0),
        //                     child: myDetailsContainer1(),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Container(
        //         alignment: AlignmentDirectional(0.3, 5.0),
        //         height: 240.0,
        //         child: FittedBox(
        //           child: Material(
        //             color: Colors.white,
        //             elevation: 14.0,
        //             borderRadius: BorderRadius.circular(24.0),
        //             shadowColor: Color(0x802196f3),
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(24.0),
        //                     child: Image(
        //                       image: NetworkImage(
        //                           "https://images.unsplash.com/photo-1524293581917-878a6d017c71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 16.0),
        //                     child: myDetailsContainer2(),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Container(
        //         alignment: AlignmentDirectional(0.3, 5.0),
        //         height: 240.0,
        //         child: FittedBox(
        //           child: Material(
        //             color: Colors.white,
        //             elevation: 14.0,
        //             borderRadius: BorderRadius.circular(24.0),
        //             shadowColor: Color(0x802196f3),
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(24.0),
        //                     child: Image(
        //                       image: NetworkImage(
        //                           "https://images.unsplash.com/photo-1514813621023-7a1e3fca8c1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 16.0),
        //                     child: myDetailsContainer3(),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Container(
        //         alignment: AlignmentDirectional(0.3, 5.0),
        //         height: 240.0,
        //         child: FittedBox(
        //           child: Material(
        //             color: Colors.white,
        //             elevation: 14.0,
        //             borderRadius: BorderRadius.circular(24.0),
        //             shadowColor: Color(0x802196f3),
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(24.0),
        //                     child: Image(
        //                       image: NetworkImage(
        //                           "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 16.0),
        //                     child: myDetailsContainer4(),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Container(
        //         alignment: AlignmentDirectional(0.3, 5.0),
        //         height: 240.0,
        //         child: FittedBox(
        //           child: Material(
        //             color: Colors.white,
        //             elevation: 14.0,
        //             borderRadius: BorderRadius.circular(24.0),
        //             shadowColor: Color(0x802196f3),
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(24.0),
        //                     child: Image(
        //                       image: NetworkImage(
        //                           "https://images.unsplash.com/photo-1553314046-6e65c0a2c124?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 16.0),
        //                     child: myDetailsContainer5(),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Container(
        //         alignment: AlignmentDirectional(0.3, 5.0),
        //         height: 240.0,
        //         child: FittedBox(
        //           child: Material(
        //             color: Colors.white,
        //             elevation: 14.0,
        //             borderRadius: BorderRadius.circular(24.0),
        //             shadowColor: Color(0x802196f3),
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(24.0),
        //                     child: Image(
        //                       image: NetworkImage(
        //                           "https://images.unsplash.com/photo-1543799382-9a0208331ef7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 16.0),
        //                     child: myDetailsContainer6(),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),