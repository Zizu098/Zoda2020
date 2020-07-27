import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoda/models/nationDetail.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/studentHome.dart';
import 'package:zoda/screens/calculator/screens/input_page.dart';
import 'package:zoda/screens/chat/views/chatrooms.dart';
import 'package:zoda/screens/chat/views/chat.dart';
import 'package:zoda/screens/chat/helper/authenticate.dart';
import 'package:zoda/models/nationDetail.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.services/nation.service.dart';
class SecondScreen extends StatefulWidget {
  SecondScreen( this.nationId);

  final String nationId;

  @override
  _SecondScreenState createState() => _SecondScreenState(this.nationId);
}

class _SecondScreenState extends State<SecondScreen> {
  String nationId;
  var nationV;
  _SecondScreenState(this.nationId);
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
    }}

  NationDetail nation;
  NationService uniServ = new NationService();
  Future<NationDetail> _fetchnationData() async {
     nationV = await uniServ.getById(this.nationId); 
     refresh();
  }
  void refresh(){
    setState(() {
      nation = nationV;
    });
  }
void initState() {
    _fetchnationData();
      // uniSort = nation;
  }

  Container _MyCard(String imageVal, String nameUniv, String country, String description) {
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.asset(imageVal),
            ListTile(
              title: Text(
                nameUniv,
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text(
                country,
                style: TextStyle(fontSize: 25, color: Colors.orange[600]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                description,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                textAlign: TextAlign.left,
                maxLines: 20,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InputPage())),
                    child: Text(
                      'Evaluate Yourself',
                      style: TextStyle(fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    color: Colors.amber[800],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 80),
                child: IconButton(
                  icon: Icon(
                    Icons.chat,
                    color: Colors.orange[600],
                    size: 45,
                  ),
                  onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatRoom())),
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if(nation == null) return Loading();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('ZODA'),
        backgroundColor: Colors.orange[600],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        // height: 200,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _MyCard(nation.nationImg, nation.nationName, nation.nationContinent, nation.nationDescription)
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
        selectedItemColor: Colors.orange[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
