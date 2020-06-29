import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/student/studentHome.dart';

class MigrationHome extends StatefulWidget {
  MigrationHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MigrationHomeState createState() => _MigrationHomeState();
}

class _MigrationHomeState extends State<MigrationHome> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;
  final dio = new Dio();
  
  double getRadiansFormDegree(double degree) {
    double unitRadian = 57.2985452;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
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
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
                  child: Container(
                    child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(35.0),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: myDetailsContanier(),
                              //   new ListView.builder(
                              // physics: ScrollPhysics(),
                              // shrinkWrap: true,
                              // itemCount: universities.length,
                              // itemBuilder: (BuildContext context, int index) =>
                              //     myDetailsContanier(context, index)),
                              // _buildTripCard(context, index)),
                            
                                // myDetailsContanier(),
                                ),
                            Container(
                              width: 300,
                              height: 168,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(35.0),
                                child: Image(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topRight,
                                  image: NetworkImage(
                                      "https://aljawaz.com/wp-content/uploads/2017/04/C5.jpg"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 30,
              bottom: 30,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFormDegree(270),
                        degOneTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFormDegree(rotationAnimation.value))
                        ..scale(degOneTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.amber[200],
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        onClick: () {},
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFormDegree(225),
                        degTwoTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFormDegree(rotationAnimation.value))
                        ..scale(degTwoTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.amber[300],
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onClick: () {},
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFormDegree(180),
                        degThreeTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFormDegree(rotationAnimation.value))
                        ..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.amber[400],
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.sort,
                          color: Colors.white,
                        ),
                        onClick: () {},
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFormDegree(rotationAnimation.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.amber[500],
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onClick: () {
                        if (animationController.isCompleted) {
                          animationController.reverse();
                        } else {
                          animationController.forward();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
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
class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
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