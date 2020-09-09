import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.services/auth.dart';
import 'package:zoda/database.services/user.service.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:zoda/screens/Home/home.dart';
import 'package:zoda/screens/Home/profile.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  UserService _userServ = new UserService();
  final AuthService _auth = AuthService();
  UserDetail user = new UserDetail();
  List<UserDetail> u, c;

  var url;

  bool infoWindowVisible = false;
  bool status = false;
  String userId;
  Future<void> getUser() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      userId = userData.uid;
    });
    _userServ.getById(userId).then((value) => {
          this.setState(() {
            user = value;
          }),
          print(user)
        });
  }

  void initState() {
    getUser();
  }

  createContactPopUp(BuildContext context) {
    if (!infoWindowVisible) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Contact us'),
              content: Text('+20 0109 1477 247'),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Ok'),
                  onPressed: () {
                    setState(() {
                      infoWindowVisible = true;
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            );
          });
    }
  }

  createSettingsPopUp(BuildContext context) {
    if (!infoWindowVisible) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Settings'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Dark mode'),
                  CustomSwitch(
                    activeColor: Colors.black,
                    value: status,
                    onChanged: (value) {
                      setState(() {
                        status = value;
                        if (status) {
                          bkColor = Colors.black;
                        } else {
                          bkColor = Colors.lightBlue[300];
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Ok'),
                  onPressed: () {
                    setState(() {
                      infoWindowVisible = true;
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) return Loading();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Upload Files'),
        backgroundColor: Colors.lightBlue[100],
      ),
      
      body: ListView(
        children: [
          Container(
            height: 750,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage("img/upload.png"),
                    fit: BoxFit.fill,
                    repeat: ImageRepeat.noRepeat)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: Colors.lightBlue[50],
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '* Read it first',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.red[200]),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ' to join our scholarship you have to \n upload this files but make sure\n that you upload it  (.PDF )\n the max size 39.99 bytes',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[400]),
                              maxLines: 15,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                ' Certificate\n type ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.lightBlue[500], fontSize: 20),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                hintText: '  Egyption ',
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue[400], fontSize: 20.0),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15.0, top: 14.0),
                              child: Text(
                                ' Total Grade ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.lightBlue[500], fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
                                  hintText: '  ../410 ',
                                  hintStyle: TextStyle(
                                      color: Colors.lightBlue[400], fontSize: 20.0),
                                ),
                                keyboardType: TextInputType.number),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                ' Address in \n Details ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.lightBlue[500], fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
                                  hintText: '   Maadi Grand city',
                                  hintStyle: TextStyle(
                                      color: Colors.lightBlue[400], fontSize: 20.0),
                                ),
                                keyboardType: TextInputType.text),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 5.0),
                              child: Text(
                                ' Year Of\n Completion ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.lightBlue[500], fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
                                  hintText: '  09/09/2017 ',
                                  hintStyle: TextStyle(
                                      color: Colors.lightBlue[400], fontSize: 20.0),
                                ),
                                keyboardType: TextInputType.datetime),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.lightBlue[500],
                              size: 35,
                            ),
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, top: 5.0),
                              child: Text(
                                ' Date of \n Birth ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.lightBlue[500], fontSize: 20),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
                                hintText: '  09/09/1998 ',
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue[400], fontSize: 20.0),
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.lightBlue[500],
                              size: 35,
                            ),
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 14.0, top: 14.0),
                              child: Text(
                                ' Certificate ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.lightBlue[500], fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
                                  hintText: '  Upload file ',
                                  hintStyle: TextStyle(
                                      color: Colors.lightBlue[400], fontSize: 20.0),
                                ),
                                keyboardType: TextInputType.url),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.file_upload,
                              color: Colors.lightBlue[500],
                              size: 35,
                            ),
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 25.0, left: 25.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[50],
                            width: 110,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15.0, top: 15.0),
                              child: Text(
                                ' NationalID ',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.0,
                                    color: Colors.lightBlue[300]),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.lightBlue[500], fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue[400],
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: new EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
                                  hintText: '  Upload file ',
                                  hintStyle: TextStyle(
                                      color: Colors.lightBlue[400], fontSize: 20.0),
                                ),
                                keyboardType: TextInputType.url),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.file_upload,
                              color: Colors.lightBlue[500],
                              size: 35,
                            ),
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        color: Colors.lightBlue[100],
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          '  Submit  ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Georgia'),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
