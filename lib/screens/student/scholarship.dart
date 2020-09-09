import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/Home/upload.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/studentHome.dart';
import 'package:zoda/screens/calculator/screens/input_page.dart';
import 'package:zoda/screens/chat/views/chatrooms.dart';
import 'package:zoda/models/universityDetail.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.services/university.service.dart';

class ScholarShip extends StatefulWidget {
  ScholarShip(this.uniId);

  final String uniId;

  @override
  _ScholarShipState createState() => _ScholarShipState(this.uniId);
}

class _ScholarShipState extends State<ScholarShip> {
  String uniId;
  var universityV;
  _ScholarShipState(this.uniId);
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    // else if (_selectedIndex == 2) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => MigrationHome()));
    // }
    else if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StudentHome()));
    }
  }

  UniversityDetail university;
  UniversityService uniServ = new UniversityService();
  Future<UniversityDetail> _fetchUniversityData() async {
    universityV = await uniServ.getById(this.uniId);
    refresh();
  }

  void refresh() {
    setState(() {
      university = universityV;
    });
  }

  void initState() {
    _fetchUniversityData();
    // uniSort = university;
  }

  Container _MyCard(
      String imageVal, String nameUniv, String country, String description) {
    return Container(
      width: 160.0,
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Wrap(
                  children: <Widget>[
                    Image.asset(imageVal),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  nameUniv,
                  style: TextStyle(fontSize: 25, color: Colors.lightBlue[300]),
                ),
                
                
              ],
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5.0),
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, height: 2),
              textAlign: TextAlign.left,
              maxLines: 20,
            ),
          ),

          Text(' I - Engineering',
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Georgia',
                  color: Colors.lightBlue[300])),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0),
            child: Row(
              children: [
                Text(
                    'While some degree programs, \nsuch as mechanicalengineering, are \ncommon across schools, others \nvary acrossinstitutions. \nFor example,civil engineering',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Georgia',
                        color: Colors.red[800])),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Upload()));
                  },
                  iconSize: 40.0,
                  color: Colors.red[300],
                )
              ],
            ),
          ),
          Text('\n II - Medicine field',
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Georgia',
                  color: Colors.lightBlue[300])),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0),
            child: Row(
              children: [
                Text(
                    'While some degree programs, \nsuch as mechanicalengineering, are \ncommon across schools, others \nvary acrossinstitutions. \nFor example,civil engineering',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Georgia',
                        color: Colors.red[800])),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Upload()));
                  },
                  iconSize: 40.0,
                  color: Colors.red[300],
                )
              ],
            ),
          ),
          Text(' \n III - Business',
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Georgia',
                  color: Colors.lightBlue[300])),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Text(
                    'While some degree programs, \nsuch as mechanicalengineering, are \ncommon across schools, others \nvary acrossinstitutions. \nFor example,civil engineering',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Georgia',
                        color: Colors.red[800])),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Upload()));
                  },
                  iconSize: 40.0,
                  color: Colors.red[300],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              color: Colors.red[50],
              
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on , color: Colors.lightBlue[200],),
                        Text(
                          '  '+country,
                          style: TextStyle(fontSize: 22, color: Colors.red[300]),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(Icons.phone , color: Colors.lightBlue[200],),
                        Text(
                          '+41223797111',
                          style: TextStyle(fontSize: 22, color: Colors.red[300]),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(Icons.web , color: Colors.lightBlue[200],),
                        Text(
                          '+https://www.unige.ch/',
                          style: TextStyle(fontSize: 17, color: Colors.red[300]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          // Row(
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: RaisedButton(
          //         onPressed: () => Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => InputPage())),
          //         child: Text(
          //           'Evaluate Yourself',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: new BorderRadius.circular(50.0),
          //         ),
          //         color: Colors.amber[800],
          //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 80),
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.chat,
          //           color: Colors.orange[600],
          //           size: 45,
          //         ),
          //         onPressed: () => Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => ChatRoom())),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (university == null) return Loading();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(university.uniName),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("img/scholarship2.jpg"),
                fit: BoxFit.fill,
                repeat: ImageRepeat.noRepeat)),
        // height: 200,
        child: 
            ListView(
              children: [
                Container(
                  child: _MyCard(university.uniImg, university.uniName,
                      university.uniCountry, university.uniDescription),
                ),
              ],
            )
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.flight),
          //   title: Text('Migration'),
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
