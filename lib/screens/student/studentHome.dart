import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/scholarship.dart';

class StudentHome extends StatefulWidget {
  StudentHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      _selectedIndex = 0;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else if (_selectedIndex == 2) {
      _selectedIndex = 0;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MigrationHome()));
    }
  }

  Container _MyCard(String imageVal, String nameUniv, String country) {
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
            ListTile(
              title: Text(nameUniv),
              subtitle: Text(country ,
              textAlign: TextAlign.right,),
              leading: IconButton(
              icon: Icon(Icons.account_balance),
              iconSize: 30,
             onPressed: (){
                Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScholarShip()));
    
             }),
            ),
            
          ],
        ),
      ),
    );
  }
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
              onTap: (){
                Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScholarShip()));
              },
            ),

            // IconButton(icon: Icon(Icons.account_balance), onPressed: null)
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('ZODA'),
        backgroundColor: Colors.orange[600],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //           header
            new UserAccountsDrawerHeader(
              accountName: Text('omar Mohamed'),
              accountEmail: Text('omar12@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blueAccent),
            ),
            //          Body
            InkWell(
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Notification'),
                leading: Icon(Icons.notifications),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
       body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
                height: 50.0,
                child: Card(
                    child: Row(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            child: new MyDialog(
                                onValueChange: null,
                                // sort,
                                initialValue: null,
                                // this.dialogValue
                                ));
                      },
                      icon: Icon(Icons.sort),
                      label: Text("Sort"),
                    )
                  ],
                )),
              ),
          Text(
            'Recommendation',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   itemCount: 10,
            //   itemBuilder: (BuildContext context, int index) => MyCard('https://www.nordlys.info/studenter/manedens-universitet/au89.jpg',
            //     'Aarhus University',
            //     'Denmark')
            //       //   child: Center(child: Text('Dummy Card Text')),
            //       // ),
            // ),
            // children: <Widget>[
          child:ListView(
             scrollDirection: Axis.horizontal,
            children: <Widget>[
            MyCard(
                'https://static.accessmba.com/application/public/cache/80411b63c045b9cb055bce91a4e567f8.jpg',
                'Geneva University',
                'Switzerland'),
            MyCard(
                'https://scholarship-positions.com/wp-content/uploads/2016/12/University-of-Helsinki-Scholarships-for-Non-EUEEA-Students-in-Finland-1024x620.jpg',
                'Helsinki University',
                'Finland'),
            MyCard(
                'https://www.turku.fi/sites/default/files/styles/opengraph/public/thumbnails/image/turun-yliopisto-paarakennus.jpg?itok=LU4YQGrP',
                'Turku University',
                'Finland'),
            MyCard(
                'https://www.unak.is/static/files/Myndir/Haskolasvaedid/ha28a-nanne-springer.jpg',
                'Akureyri University',
                'Iceland'),
            MyCard(
                'https://guidetoiceland.imgix.net/389524/x/0/the-historical-holar-in-hjaltadalur-the-episcopal-see-and-nyibaer-turf-house-in-north-iceland-1?auto=compress%2Cformat&ch=Width%2CDPR&dpr=1&ixlib=php-3.1.0&w=883&s=cd19590d46456cfbe4462afc03a2d924',
                'Hólar  University',
                'Iceland'),
          ],
          )
          ),
          Text(
            'Rest of nations',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView(
              // shrinkWrap: true,
              // itemCount: 3,
              // itemBuilder: (BuildContext context, int index){
              // children: <Widget>[
          // child:ListView(
             scrollDirection: Axis.vertical,
            children: <Widget>[
            MyCard(
                'https://www.nordlys.info/studenter/manedens-universitet/au89.jpg',
                'Aarhus University',
                'Denmark'),
            MyCard(
                'https://static.accessmba.com/application/public/cache/80411b63c045b9cb055bce91a4e567f8.jpg',
                'Geneva University',
                'Switzerland'),
            MyCard(
                'https://scholarship-positions.com/wp-content/uploads/2016/12/University-of-Helsinki-Scholarships-for-Non-EUEEA-Students-in-Finland-1024x620.jpg',
                'Helsinki University',
                'Finland'),
            MyCard(
                'https://www.turku.fi/sites/default/files/styles/opengraph/public/thumbnails/image/turun-yliopisto-paarakennus.jpg?itok=LU4YQGrP',
                'Turku University',
                'Finland'),
            MyCard(
                'https://www.unak.is/static/files/Myndir/Haskolasvaedid/ha28a-nanne-springer.jpg',
                'Akureyri University',
                'Iceland'),
            MyCard(
                'https://guidetoiceland.imgix.net/389524/x/0/the-historical-holar-in-hjaltadalur-the-episcopal-see-and-nyibaer-turf-house-in-north-iceland-1?auto=compress%2Cformat&ch=Width%2CDPR&dpr=1&ixlib=php-3.1.0&w=883&s=cd19590d46456cfbe4462afc03a2d924',
                'Hólar  University',
                'Iceland'),
          ],
        
              // => _MyCard('https://static.accessmba.com/application/public/cache/80411b63c045b9cb055bce91a4e567f8.jpg',
              //   'Geneva University',
              //   'Switzerland')
                // return Card(
                //   child: ListTile(
                //       title: Text('Motivation $int'),
                //       subtitle: Text('this is a description of the motivation')),
                // );
              // },
            ),
          ),
        ],
      ),

        // margin: EdgeInsets.symmetric(vertical: 2.0),
        // height: 200,
        // children: <Widget>[
          // child:ListView(
          //    scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          //   MyCard(
          //       'https://www.nordlys.info/studenter/manedens-universitet/au89.jpg',
          //       'Aarhus University',
          //       'Denmark'),
          //   MyCard(
          //       'https://static.accessmba.com/application/public/cache/80411b63c045b9cb055bce91a4e567f8.jpg',
          //       'Geneva University',
          //       'Switzerland'),
          //   MyCard(
          //       'https://scholarship-positions.com/wp-content/uploads/2016/12/University-of-Helsinki-Scholarships-for-Non-EUEEA-Students-in-Finland-1024x620.jpg',
          //       'Helsinki University',
          //       'Finland'),
          //   MyCard(
          //       'https://www.turku.fi/sites/default/files/styles/opengraph/public/thumbnails/image/turun-yliopisto-paarakennus.jpg?itok=LU4YQGrP',
          //       'Turku University',
          //       'Finland'),
          //   MyCard(
          //       'https://www.unak.is/static/files/Myndir/Haskolasvaedid/ha28a-nanne-springer.jpg',
          //       'Akureyri University',
          //       'Iceland'),
          //   MyCard(
          //       'https://guidetoiceland.imgix.net/389524/x/0/the-historical-holar-in-hjaltadalur-the-episcopal-see-and-nyibaer-turf-house-in-north-iceland-1?auto=compress%2Cformat&ch=Width%2CDPR&dpr=1&ixlib=php-3.1.0&w=883&s=cd19590d46456cfbe4462afc03a2d924',
          //       'Hólar  University',
          //       'Iceland'),
          // ],
          // ),
        //    child: Column(
        //   // scrollDirection: Axis.vertical,
        //   children: <Widget>[
        //     _MyCard('https://www.nordlys.info/studenter/manedens-universitet/au89.jpg', 'Aarhus University', 'Denmark'),
        //     _MyCard('https://static.accessmba.com/application/public/cache/80411b63c045b9cb055bce91a4e567f8.jpg', 'Geneva University', 'Switzerland'),
        //     _MyCard('https://scholarship-positions.com/wp-content/uploads/2016/12/University-of-Helsinki-Scholarships-for-Non-EUEEA-Students-in-Finland-1024x620.jpg', 'Helsinki University', 'Finland'),
        //     _MyCard('https://www.turku.fi/sites/default/files/styles/opengraph/public/thumbnails/image/turun-yliopisto-paarakennus.jpg?itok=LU4YQGrP', 'Turku University', 'Finland'),
        //     _MyCard('https://www.unak.is/static/files/Myndir/Haskolasvaedid/ha28a-nanne-springer.jpg', 'Akureyri University', 'Iceland'),
        //     _MyCard('https://guidetoiceland.imgix.net/389524/x/0/the-historical-holar-in-hjaltadalur-the-episcopal-see-and-nyibaer-turf-house-in-north-iceland-1?auto=compress%2Cformat&ch=Width%2CDPR&dpr=1&ixlib=php-3.1.0&w=883&s=cd19590d46456cfbe4462afc03a2d924', 'Hólar  University', 'Iceland'),
        //   ],
        // ),
        // ],
      // ),     
     

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
        selectedItemColor: Colors.orange[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
 // Column(
      //   children: <Widget>[
      //     Container(
      //       child: Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Text(
      //           'Recommendation',
      //           style: TextStyle(
      //               color: Colors.orange[800],
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ),

      //     // Row(
      //     //   mainAxisSize: MainAxisSize.max,
      //     //   children: <Widget>[
      //     //     myButton('London'),
      //     //     myButton('Finland'),
      //     //     myButton('Denmark'),
      //     //     myButton('Norway'),
      //     //     myButton('Iceland'),
      //     //     myButton('Switzerland'),
      //     //   ],
      //     // ),
      //     // Recommend(),
      //   ],
      // ),

// class CircularButton extends StatelessWidget {
//   final double width;
//   final double height;
//   final Color color;
//   final Icon icon;
//   final Function onClick;

//   CircularButton(
//       {this.color, this.width, this.height, this.icon, this.onClick});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       width: width,
//       height: height,
//       child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
//     );
//   }
// }

// List universities = [
//   {
//     'uniName': 'Alberta',
//     'uniRate': 5,
//     'uniCountry': 'Italia',
//     'uniImg': 'https://aljawaz.com/wp-content/uploads/2017/04/C5.jpg'
//   },
//   {
//     'uniName': 'Ain shams',
//     'uniRate': 5,
//     'uniCountry': 'Egypt',
//     'uniImg': 'https://aljawaz.com/wp-content/uploads/2017/04/C5.jpg'
//   }
// ];

// Widget myDetailsContanier() {
//   return Column(
//     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Container(
//           width: 190,
//           height: 100,
//           child: ClipRRect(
//             borderRadius: new BorderRadius.circular(35.0),
//             child: Image(
//               fit: BoxFit.contain,
//               alignment: Alignment.center,
//               image: NetworkImage(
//                   "https://aljawaz.com/wp-content/uploads/2017/04/C5.jpg"),
//             ),
//           ),
//         ),
//       ),
//       Row(children: <Widget>[
//         Text(
//           'zzzzz' + '     ',
//           style: TextStyle(
//             color: Colors.orange[500],
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.left,
//         ),
//         Icon(
//           FontAwesomeIcons.solidStar,
//           color: Colors.amber[900],
//           size: 10.0,
//         ),
//         Icon(
//           FontAwesomeIcons.solidStar,
//           color: Colors.amber[900],
//           size: 10.0,
//         ),
//         Icon(
//           FontAwesomeIcons.solidStar,
//           color: Colors.amber[900],
//           size: 10.0,
//         ),
//         Icon(
//           FontAwesomeIcons.solidStar,
//           color: Colors.amber[900],
//           size: 10.0,
//         ),
//         Icon(
//           FontAwesomeIcons.solidStarHalf,
//           color: Colors.amber[900],
//           size: 10.0,
//         ),

//         // Text(
//         //           '4.3',
//         //           style: TextStyle(color: Colors.black54, fontSize: 18.0),
//         //         ),
//       ]),
//     ],
//   );
// }

// @override
// Widget build(BuildContext context) {
//   loadData();
//   load();
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       primaryColor: Colors.white,
//     ),
//     home: Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white70,
//         title: Text('Zoda'),
//       ),
//       drawer: new Drawer(
//         child: new ListView(
//           children: <Widget>[
//             //           header
//             new UserAccountsDrawerHeader(
//               accountName: Text('omar Mohamed'),
//               accountEmail: Text('omar12@gmail.com'),
//               currentAccountPicture: GestureDetector(
//                 child: new CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               decoration: new BoxDecoration(color: Colors.blueAccent),
//             ),
//             //          Body
//             InkWell(
//               child: ListTile(
//                 title: Text('Home Page'),
//                 leading: Icon(Icons.home),
//                  onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Home()));
//                       },
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Notification'),
//                 leading: Icon(Icons.notifications),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Settings'),
//                 leading: Icon(Icons.settings),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('About'),
//                 leading: Icon(Icons.help),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         children: <Widget>[
//           Container(
//             child: Center(
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                   items: listDrop,
//                   value: selected,
//                   iconSize: 40.0,
//                   elevation: 1,
//                   style: new TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   icon: new Icon(Icons.arrow_drop_down, color: Colors.white),
//                   hint: Text(
//                     '            Select feild',
//                     style: TextStyle(
//                         fontSize: 10.0, fontWeight: FontWeight.bold),
//                   ),
//                   onChanged: (value) {
//                     selected = value;
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             margin: EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 10,
//             ),
//             width: 100.0,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               border: Border.all(
//                 color: Colors.blueAccent[100],
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(24.0),
//             ),
//           ),
//           Column(
//             children: <Widget>[
//               Container(
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton(
//                     items: listed,
//                     value: select,
//                     iconSize: 40.0,
//                     elevation: 1,
//                     style: new TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     icon:
//                         new Icon(Icons.arrow_drop_down, color: Colors.white),
//                     hint: Center(
//                       child: Text(
//                         '         Select University',
//                         style: TextStyle(
//                             fontSize: 10.0, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       select = value;

//                       switch (value) {
//                         case "Toronto":
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => FirstScreen()),
//                           );
//                           break;
//                       }
//                     },
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.blueAccent,
//                   border: Border.all(
//                     color: Colors.blueAccent[100],
//                     width: 2,
//                   ),
//                   borderRadius: BorderRadius.circular(24.0),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             "  Recomended",
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.left,
//           ),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               alignment: AlignmentDirectional(0.3, 5.0),
//               height: 240.0,
//               child: FittedBox(
//                 child: Material(
//                   color: Colors.white,
//                   elevation: 14.0,
//                   borderRadius: BorderRadius.circular(24.0),
//                   shadowColor: Color(0x802196f3),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(24.0),
//                           child: Image(
//                             image: NetworkImage(
//                                 "https://aljawaz.com/wp-content/uploads/2017/04/C5.jpg"),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16.0),
//                           // child: myDetailsContainer5(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               alignment: AlignmentDirectional(0.3, 5.0),
//               height: 260.0,
//               child: FittedBox(
//                 child: Material(
//                   color: Colors.white,
//                   elevation: 14.0,
//                   borderRadius: BorderRadius.circular(24.0),
//                   shadowColor: Color(0x802196f3),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(24.0),
//                           child: Image(
//                             image: NetworkImage(
//                                 "http://thearabianoz.com.au/wp-content/uploads/2018/12/dccw-view-from-darling-drive-1024x648.jpg"),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16.0),
//                           // child: myDetailsContainer6(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             title: Text('School'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.flight),
//             title: Text('Immigration'),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     ),
//   );
// }
// List<DropdownMenuItem<String>> listDrop = [];
// String selected;
// List<String> drop = [
//   'Computer Science',
//   'Engineering',
//   'Accounting',
//   'Medicine',
//   'Media',
// ];
// List<DropdownMenuItem<String>> listed = [];
// String select;
// List<String> droping = [
//   'Toronto',
//   'British Columbia',
//   'McGill',
//   'Montreal',
//   'Alberta',
//   'Sydney',
//   'James Cook',
//   'Adelaide',
//   'Western Australia',
// ];
// final dio = new Dio();
// void loadData() {
//   listDrop = [];
//   listDrop = drop
//       .map((val) => DropdownMenuItem(
//             child: SizedBox(
//               width: 100.0, // for example
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
//               width: 100.0, // for example
//               child: Text(valu, textAlign: TextAlign.center),
//             ),
//             value: valu,
//           ))
//       .toList();
// }
// drawer: new Drawer(
//   child: new ListView(
//     children: <Widget>[
//       //           header
//       new UserAccountsDrawerHeader(
//         accountName: Text('omar Mohamed'),
//         accountEmail: Text('omar12@gmail.com'),
//         currentAccountPicture: GestureDetector(
//           child: new CircleAvatar(
//             backgroundColor: Colors.grey,
//             child: Icon(
//               Icons.person,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         decoration: new BoxDecoration(color: Colors.blueAccent),
//       ),
//       //          Body
//       InkWell(
//         child: ListTile(
//           title: Text('Home Page'),
//           leading: Icon(Icons.home),
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Home()));
//           },
//         ),
//       ),

//       InkWell(
//         onTap: () {},
//         child: ListTile(
//           title: Text('Notification'),
//           leading: Icon(Icons.notifications),
//         ),
//       ),

//       InkWell(
//         onTap: () {},
//         child: ListTile(
//           title: Text('Settings'),
//           leading: Icon(Icons.settings),
//         ),
//       ),

//       InkWell(
//         onTap: () {},
//         child: ListTile(
//           title: Text('About'),
//           leading: Icon(Icons.help),
//         ),
//       ),
//     ],
//   ),
// ),
// AnimationController animationController;
// Animation degOneTranslationAnimation,
//     degTwoTranslationAnimation,
//     degThreeTranslationAnimation;
// Animation rotationAnimation;
// final dio = new Dio();

// double getRadiansFormDegree(double degree) {
//   double unitRadian = 57.2985452;
//   return degree / unitRadian;
// }

// @override
// void initState() {
//   animationController =
//       AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//   degOneTranslationAnimation = TweenSequence([
//     TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
//     TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
//   ]).animate(animationController);
//   degTwoTranslationAnimation = TweenSequence([
//     TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
//     TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
//   ]).animate(animationController);
//   degThreeTranslationAnimation = TweenSequence([
//     TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
//     TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
//   ]).animate(animationController);
//   rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
//       CurvedAnimation(parent: animationController, curve: Curves.easeOut));
//   super.initState();
//   animationController.addListener(() {
//     setState(() {});
//   });
// }
//  Positioned(
//             right: 30,
//             bottom: 30,
//             child: Stack(
//               children: <Widget>[
//                 Transform.translate(
//                   offset: Offset.fromDirection(getRadiansFormDegree(270),
//                       degOneTranslationAnimation.value * 100),
//                   child: Transform(
//                     transform: Matrix4.rotationZ(
//                         getRadiansFormDegree(rotationAnimation.value))
//                       ..scale(degOneTranslationAnimation.value),
//                     alignment: Alignment.center,
//                     child: CircularButton(
//                       color: Colors.orange[400],
//                       width: 50,
//                       height: 50,
//                       icon: Icon(
//                         Icons.filter_list,
//                         color: Colors.white,
//                       ),
//                       onClick: () {},
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset.fromDirection(getRadiansFormDegree(225),
//                       degTwoTranslationAnimation.value * 100),
//                   child: Transform(
//                     transform: Matrix4.rotationZ(
//                         getRadiansFormDegree(rotationAnimation.value))
//                       ..scale(degTwoTranslationAnimation.value),
//                     alignment: Alignment.center,
//                     child: CircularButton(
//                       color: Colors.orange[500],
//                       width: 50,
//                       height: 50,
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       ),
//                       onClick: () {},
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset.fromDirection(getRadiansFormDegree(180),
//                       degThreeTranslationAnimation.value * 100),
//                   child: Transform(
//                     transform: Matrix4.rotationZ(
//                         getRadiansFormDegree(rotationAnimation.value))
//                       ..scale(degThreeTranslationAnimation.value),
//                     alignment: Alignment.center,
//                     child: CircularButton(
//                       color: Colors.orange[700],
//                       width: 50,
//                       height: 50,
//                       icon: Icon(
//                         Icons.sort,
//                         color: Colors.white,
//                       ),
//                       onClick: () {},
//                     ),
//                   ),
//                 ),
//                 Transform(
//                   transform: Matrix4.rotationZ(
//                       getRadiansFormDegree(rotationAnimation.value)),
//                   alignment: Alignment.center,
//                   child: CircularButton(
//                     color: Colors.orange[600],
//                     width: 60,
//                     height: 60,
//                     icon: Icon(
//                       Icons.menu,
//                       color: Colors.white,
//                     ),
//                     onClick: () {
//                       if (animationController.isCompleted) {
//                         animationController.reverse();
//                       } else {
//                         // createAlertDialog(context);
//                         animationController.forward();
//                       }
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
// Container(
//   width: size.width,
//   height: size.height,
//   child: Stack(
//     children: <Widget>[
//       ListView(
//         scrollDirection: Axis.vertical,
//         children: <Widget>[
//           Padding(
//             padding:
//                 const EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
//             child: Container(
//               child: FittedBox(
//                 child: Material(
//                   color: Colors.white,
//                   elevation: 14.0,
//                   borderRadius: BorderRadius.circular(35.0),
//                   shadowColor: Color(0x802196F3),
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           myDetailsContanier(),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),

//     ],
//   ),
// )
class MyDialog extends StatefulWidget {
  const MyDialog({this.onValueChange, this.initialValue});

  final int initialValue;
  final void Function(int) onValueChange;

  @override
  State createState() => new MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  int _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialValue;
  }

  Widget build(BuildContext context) {
    return new SimpleDialog(
      children: <Widget>[
        ListTile(
          title: Text('sort by name'),
          leading: Radio(
            value: 0,
            groupValue: _selectedId,
            onChanged: (value) {
              setState(() {
                _selectedId = value;
              });
              widget.onValueChange(value);
              Navigator.pop(context);
            },
          ),
        ),
        ListTile(
          title: Text('sort by rate'),
          leading: Radio(
            value: 1,
            groupValue: _selectedId,
            onChanged: (value) {
              setState(() {
                _selectedId = value;
              });

              widget.onValueChange(value);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
