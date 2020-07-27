import 'package:flutter/material.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/student/scholarship.dart';
import 'package:zoda/screens/student/studentHome.dart';
import 'package:zoda/database.services/nation.service.dart';
import 'package:zoda/models/nationDetail.dart';
import 'package:zoda/screens/migration/SecondScreen.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MigrationHome extends StatefulWidget {
  MigrationHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MigrationHomeState createState() => _MigrationHomeState();
}

class _MigrationHomeState extends State<MigrationHome> {
  //  int _selectedIndex = 2;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   if (_selectedIndex == 1) {
  //     _selectedIndex = 0;
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //   } else if (_selectedIndex == 0) {
  //     _selectedIndex = 0;
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => StudentHome()));
  //   }
  // }


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

 List<NationDetail> nation;
 List<NationDetail> natSort ;
 List<NationDetail> natRec ;
 NationService natServ = new NationService();
  Future<List<NationDetail>> _fetchNationData() async {
    nation = await natServ.fetchData(); 
    natSort = await natServ.fetchData();  
    setState(() {
      nation.sort((a, b) => a.hit.compareTo(b.hit));
      // if (nation == null) Loading();
      // else   {uniSort = nation; uniRec = nation;}
    });
  }
void initState() {
    _fetchNationData();
      // uniSort = nation;
  }
  
  Widget _buildRecommendationCard(BuildContext context, int index){ 
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.asset(nation[nation.length - index -1].nationImg),
            ListTile(
              title: Text(nation[nation.length - index -1].nationName),
              subtitle: Text(nation[nation.length - index -1].nationContinent),
              onTap: (){
                setState(() async{
                  nation[nation.length - index -1].hit ++;
                  await natServ.update(nation[nation.length - index -1], nation[nation.length - index -1].nationId);
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(nation[nation.length - index -1].nationId)));
                });       
              },
            ),
            // IconButton(icon: Icon(Icons.account_balance), onPressed: null)
            Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      SmoothStarRating(
                        rating:
                            nation[index].nationEvaluation.toDouble(),
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
  Widget _bBuildCard(){
    for(k ; k< nation.length; k++){
     return _buildCard(k);
    }
  }
  Widget _buildCard(int k){
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.asset(natSort[k].nationImg),
            ListTile(
              title: Text(natSort[k].nationName),
              subtitle: Text(natSort[k].nationContinent),
              onTap: (){
                natSort[k].hit ++;
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScholarShip(natSort[k].nationId)));
              },
            ),
             Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      SmoothStarRating(
                        rating:
                            natSort[k].nationEvaluation.toDouble(),
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
            // IconButton(icon: Icon(Icons.account_balance), onPressed: null)
          ],
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
        natSort.sort((a, b) => a.nationName.compareTo(b.nationName));
      });
    } else {
      // sort by rate
      this.setState(() {
        natSort.sort((a, b) => a.nationEvaluation.compareTo(b.nationEvaluation));
      });
    }
    this.setState(() {
      dialogValue = value;
      _dataInProgres = false;
    });
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
            style: TextStyle(fontSize: 18,color: Colors.white),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => _buildRecommendationCard(context, index)
            ),
          ),
          Text(
            'Rest of nations',
            style: TextStyle(fontSize: 18,color: Colors.white),
          ),
          Expanded(
           child: ListView(
             children: <Widget>[
                 for(k = 0; k< nation.length; k++)  _bBuildCard()
           ])
    )
              
                            
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

