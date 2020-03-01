import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@override
class FirstScreen extends StatelessWidget {
  // Widget myDetailsContainer1() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.only(left: 8.0),
  //         child: Container(
  //             child: Text(
  //           "Toronto",
  //           style: TextStyle(
  //               color: Colors.blueAccent,
  //               fontSize: 30.0,
  //               fontWeight: FontWeight.bold),
  //         )),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 8.0),
  //         child: Container(
  //             child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: <Widget>[
  //             Container(
  //                 child: Text(
  //               "4.3",
  //               style: TextStyle(
  //                 color: Colors.black54,
  //                 fontSize: 18.0,
  //               ),
  //             )),
  //             Container(
  //               child: Icon(
  //                 FontAwesomeIcons.solidStar,
  //                 color: Colors.amber,
  //                 size: 15.0,
  //               ),
  //             ),
  //             Container(
  //               child: Icon(
  //                 FontAwesomeIcons.solidStar,
  //                 color: Colors.amber,
  //                 size: 15.0,
  //               ),
  //             ),
  //             Container(
  //               child: Icon(
  //                 FontAwesomeIcons.solidStar,
  //                 color: Colors.amber,
  //                 size: 15.0,
  //               ),
  //             ),
  //             Container(
  //               child: Icon(
  //                 FontAwesomeIcons.solidStar,
  //                 color: Colors.amber,
  //                 size: 15.0,
  //               ),
  //             ),
  //             Container(
  //               child: Icon(
  //                 FontAwesomeIcons.solidStarHalf,
  //                 color: Colors.amber,
  //                 size: 15.0,
  //               ),
  //             ),
  //             Container(
  //                 child: Text(
  //               "",
  //               style: TextStyle(
  //                 color: Colors.black54,
  //                 fontSize: 18.0,
  //               ),
  //             )),
  //           ],
  //         )),
  //       ),
  //       Container(
  //           child: Text(
  //         "",
  //         style: TextStyle(
  //             color: Colors.black54,
  //             fontSize: 30.0,
  //             // fontWeight: FontWeight.bold
  //             ),
  //       )),
    //   ],
    // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("School"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  // alignment: AlignmentDirectional(0.3, 5.0),
                  height: 240.0,
                  child: FittedBox(
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196f3),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image(
                                image: NetworkImage(
                                    "https://aljawaz.com/wp-content/uploads/2017/04/C1-768x427.jpg"),
                              ),
                            ),
                          ),
                          // Container(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 16.0),
                          //     child: myDetailsContainer1(),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Text("Requirements"),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            Container(
              child: Center(
                child: RaisedButton(
                  // onPressed: () {
                  //   Navigator.pop(context);
                  // },
                  child: Text('Go back!'),
                ),
              ),
            ),
          ],
        ));
  }
}
