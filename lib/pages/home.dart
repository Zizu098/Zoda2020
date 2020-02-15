import 'package:flutter/material.dart';
import 'package:zoda/pages/CustomShapeClipper.dart';
import 'package:zoda/pages/migration/migrationHome.dart';
import 'package:zoda/pages/student/studentHome.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart,
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
List<String> locations = ['Cairo (Cai)', 'Alexandria (Alex)'];

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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationIndex],
                              style: dropDownLabelStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0],
                                style: dropDownMenuItemStyle),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1],
                                style: dropDownMenuItemStyle),
                            value: 1,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Where would\nyou want to go?',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: TextField(
                          controller: TextEditingController(text: locations[0]),
                          style: dropDownMenuItemStyle,
                          cursorColor: appTheme.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 14.0),
                            suffix: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => studentHome()));
                        },
                        child: Text('ScholarShip'),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => migrationHome()));
                        },
                        child: Text('Migration'),
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

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  ChoiceChip(this.icon, this.text, this.isSelected);
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);
var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Currently Watched Items",
            style: dropDownMenuItemStyle,
          ),
          Spacer(),
          Text(
            "View ALL(5)",
            style: viewAllStyle,
          ),
        ],
      ),
    ),
    Container(
      height: 65,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    )
  ],
);
List<CityCard> cityCards = [
  CityCard("assets/images/map1.png", "North Of America"),
  CityCard("assets/images/map2.png", "South Of America"),
  CityCard("assets/images/map3.png", "Europe"),
  CityCard("assets/images/map4.jpg", "Asia"),
  CityCard("assets/images/map5.png", "Australia"),
  CityCard("assets/images/map6.png", "Africa"),
];

class CityCard extends StatelessWidget {
  final String imagePath, continentName;
  CityCard(this.imagePath, this.continentName);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 60.0,
          width: 40.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
