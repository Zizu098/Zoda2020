import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';

class studentHome extends StatefulWidget {
  studentHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _studentHomeState createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;
  List<String> drop = [
    'Computer Science',
    'Engineering',
    'Accounting',
    'Medicine',
    'Media',
  ];
  List<DropdownMenuItem<String>> listed = [];
  String select = null;
  List<String> droping = [
    'Toronto',
    'British Columbia',
    'McGill',
    'Montreal',
    'Alberta',
    'Sydney',
    'James Cook',
    'Adelaide',
    'Western Australia',
  ];
  final dio = new Dio(); // for http requests
  Widget _appBarTitle = new Text('Search...');
  Icon _searchIcon = new Icon(Icons.search);
  void loadData() {
    listDrop = [];
    listDrop = drop
        .map((val) => DropdownMenuItem(
              child: SizedBox(
                width: 150.0, // for example
                child: Text(val, textAlign: TextAlign.center),
              ),
              value: val,
            ))
        .toList();
  }

  void load() {
    listed = [];
    listed = droping
        .map((valu) => DropdownMenuItem(
              child: SizedBox(
                width: 150.0, // for example
                child: Text(valu, textAlign: TextAlign.center),
              ),
              value: valu,
            ))
        .toList();
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
      }
    });
  }


  Widget myDetailsContainer5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Alberta",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.3",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                  child: Text(
                "",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
        ),
        Container(
            child: Text(
          "",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget myDetailsContainer6() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Sydney",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.3",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                  child: Text(
                "",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
        ),
        Container(
            child: Text(
          "",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    load();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white70,
          title: Text('Zoda'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
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
                onTap: () {},
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home),
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
                  leading: Icon(Icons.help, color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: listDrop,
                    value: selected,
                    iconSize: 40.0,
                    elevation: 1,
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    icon: new Icon(Icons.arrow_drop_down, color: Colors.white),
                    hint: Text(
                      '            Select feild',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      selected = value;
                      setState(() {});
                    },
                  ),
                ),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              width: 150.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(
                  color: Colors.blueAccent[100],
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: listed,
                      value: select,
                      iconSize: 40.0,
                      elevation: 1,
                      style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      icon:
                          new Icon(Icons.arrow_drop_down, color: Colors.white),
                      hint: Center(
                        child: Text(
                          '         Select University',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onChanged: (value) {
                        select = value;

                        switch (value) {
                          case "Toronto":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstScreen()),
                            );
                            break;
                        }
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.blueAccent[100],
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ],
            ),
            Text(
              "  Recomended",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: AlignmentDirectional(0.3, 5.0),
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
                                  "https://aljawaz.com/wp-content/uploads/2017/04/C5.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer5(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: AlignmentDirectional(0.3, 5.0),
                height: 260.0,
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
                                  "http://thearabianoz.com.au/wp-content/uploads/2018/12/dccw-view-from-darling-drive-1024x648.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer6(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              title: Text('Immigration'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
