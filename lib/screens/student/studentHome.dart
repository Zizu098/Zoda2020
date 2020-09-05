import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/migration/migrationHome.dart';
import 'package:zoda/screens/student/scholarship.dart';
import 'package:zoda/database.services/university.service.dart';
import 'package:zoda/models/universityDetail.dart';
import 'package:zoda/components/loading/loading.dart';

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
    }
    // else if (_selectedIndex == 2) {
    //   _selectedIndex = 0;
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => MigrationHome()));
    // }
  }

  List<UniversityDetail> university;
  List<UniversityDetail> uniSort;
  List<UniversityDetail> uniRec;
  UniversityService uniServ = new UniversityService();
  Future<List<UniversityDetail>> _fetchUniversityData() async {
    university = await uniServ.fetchData();
    uniSort = await uniServ.fetchData();
    setState(() {
      university.sort((a, b) => a.hit.compareTo(b.hit));
      if (university == null) Loading();
      // else   {uniSort = university; uniRec = university;}
    });
  }

  void initState() {
    _fetchUniversityData();
    // uniSort = university;
  }

  Widget _buildRecommendationCard(BuildContext context, int index) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: AssetImage("img/homebotton.jpg"),
              fit: BoxFit.fill,
              repeat: ImageRepeat.noRepeat)),
      width: 160.0,
      height: 85.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.asset(university[university.length - index - 1].uniImg),
            ListTile(
              title: Text(university[university.length - index - 1].uniName),
              subtitle:
                  Text(university[university.length - index - 1].uniCountry),
              onTap: () {
                setState(() async {
                  university[university.length - index - 1].hit++;
                  await uniServ.update(
                      university[university.length - index - 1],
                      university[university.length - index - 1].uniId);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScholarShip(
                              university[university.length - index - 1]
                                  .uniId)));
                });
              },
            ),
            // IconButton(icon: Icon(Icons.account_balance), onPressed: null)
            Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(children: <Widget>[
                  SmoothStarRating(
                    rating: university[index].uniEvaluation.toDouble(),
                    isReadOnly: true,
                    size: 20,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    onRated: null,
                  ),
                ])),
          ],
        ),
      ),
    );
  }

  int k = 0;
  Widget _bBuildCard() {
    for (k; k < university.length; k++) {
      return _buildCard(k);
    }
  }

  Widget _buildCard(int k) {
    return Padding(
      padding: const EdgeInsets.only(left:40.0, right: 40.0),
      child: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("img/homebotton.jpg"),
                fit: BoxFit.fill,
                repeat: ImageRepeat.noRepeat)),
        child: Card(
          child: Wrap(
            children: <Widget>[
              Image.asset(uniSort[k].uniImg),
              ListTile(
                title: Text(uniSort[k].uniName),
                subtitle: Text(uniSort[k].uniCountry),
                onTap: () {
                  uniSort[k].hit++;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScholarShip(uniSort[k].uniId)));
                },
              ),
              Row(children: <Widget>[
                SmoothStarRating(
                  rating: uniSort[k].uniEvaluation.toDouble(),
                  isReadOnly: true,
                  size: 20,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 2.0,
                  onRated: null,
                ),
              ]),

              // IconButton(icon: Icon(Icons.account_balance), onPressed: null)
            ],
          ),
        ),
      ),
    );
  }

  bool _dataInProgres = true;
  int dialogValue = 2;

  sort(value) async {
    this.setState(() {
      _dataInProgres = true;
    });
    if (value == 0) {
      //sort by name
      this.setState(() {
        uniSort.sort((a, b) => a.uniName.compareTo(b.uniName));
      });
    } else {
      // sort by rate
      this.setState(() {
        uniSort.sort((a, b) => a.uniEvaluation.compareTo(b.uniEvaluation));
      });
    }
    this.setState(() {
      dialogValue = value;
      _dataInProgres = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (university == null) return Loading();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('ZODA'),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("img/scholarship.jpg"),
                fit: BoxFit.fill,
                repeat: ImageRepeat.noRepeat)),
        child: Column(
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
                            onValueChange: sort,
                            // sort,
                            initialValue: this.dialogValue,
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
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildRecommendationCard(context, index)),
            ),
            Text(
              'Rest of nations',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Expanded(
                child: ListView(children: <Widget>[
              for (k = 0; k < university.length; k++) _bBuildCard()
            ]))
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
