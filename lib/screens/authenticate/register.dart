import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.Services/auth.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:zoda/theme/input.dart';
import 'login.dart';
import 'package:zoda/database.services/user.service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  UserDetail userData = new UserDetail();
  UserService userServ = new UserService();
  static List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  File _image;
  String fileName;

  int _currentStep = 0;

  String _firstName = "";
  String _lastName = "";
  int _age = 0;
  String _confirmPassword = "";
  String _address = "";
  String _email = "";
  String _phone = "";
  String _password = "";
  String error = '';
  bool loading = false;
  var url;

  String conButton = 'Next';
  String dropdownValue = 'None';

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      var downUrl = fileName;
      url = downUrl.toString();
      setState(() {
        userData.imgUrl = url;
      });
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    }

    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.lightBlue[900],
              elevation: 0.0,
              title: Text('Registration'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  textColor: Colors.white,
                  label: Text('Login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ],
            ),
            body: Container(
              child: Theme(
                data: ThemeData(primaryColor: Color(0xfff9811e)),
                child: Stepper(
                  controlsBuilder: (BuildContext context,
                      {VoidCallback onStepContinue,
                      VoidCallback onStepCancel}) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        if (_currentStep > 0)(
                          
                            RaisedButton(
                              color: Colors.lightBlue[900],
                              padding: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side:
                                      BorderSide(color: Colors.lightBlue[900])),
                              onPressed: onStepCancel,
                              child: Text('Back',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                            ))
                          ,
                        RaisedButton(
                          color: Colors.lightBlue[900],
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.lightBlue[900])),
                          onPressed: onStepContinue,
                          child: Text(conButton,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)),
                        ),
                      ],
                    );
                  },
                  currentStep: this._currentStep,
                  steps: [
                    Step(
                      title: Text('  '),
                      content: Container(
                        padding: EdgeInsets.only(bottom: 150),
                        child: Form(
                          key: formKeys[0],
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                initialValue: _firstName,
                                onChanged: (String value) {
                                  setState(() {
                                    _firstName = value;
                                    // userData.userId = '1';
                                    userData.firstName = value;
                                  });
                                },
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Fisrt name'),
                                validator: (val) => val.isEmpty
                                    ? 'Enter your First name'
                                    : null,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                initialValue: _lastName,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Last name'),
                                validator: (val) => val.isEmpty
                                    ? 'Enter your Last name '
                                    : null,
                                onChanged: (String value) {
                                  setState(() {
                                    _lastName = value;
                                    userData.lastName = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                initialValue: _email,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Email'),
                                validator: (val) {
                                  if (val.isEmpty || !val.contains('@')) {
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _email = value;
                                    userData.email = value;
                                  });
                                },
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Password'),
                                validator: (val) => val.length < 6
                                    ? 'Enter password 6+ chars long'
                                    : null,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    _password = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Confirm Password'),
                                validator: (val) => val.isEmpty
                                    ? 'Enter the Confirm Password'
                                    : _confirmPassword != _password
                                        ? 'Password not matched'
                                        : null,
                                onChanged: (value) {
                                  setState(() {
                                    _confirmPassword = value;
                                  });
                                },
                                obscureText: true,
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isActive: true,
                    ),
                    Step(
                      title: Text(' '),
                      content: Container(
                        padding: EdgeInsets.only(bottom: 120),
                        child: Form(
                          key: formKeys[1],
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                initialValue: _address,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Address'),
                                validator: (val) =>
                                    val.isEmpty ? 'Enter your address' : null,
                                onChanged: (value) {
                                  setState(() {
                                    _address = value;
                                    userData.address = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                initialValue: _age == 0 ? "" : _age.toString(),
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Age'),
                                validator: (val) => val.isEmpty
                                    ? "Enter Your Age"
                                    : int.parse(val) <= 10
                                        ? 'your age should be greater than 10'
                                        : int.parse(val) >= 90
                                            ? 'your age should be smaller than 80'
                                            : null,
                                onChanged: (value) {
                                  setState(() {
                                    _age = int.parse(value);
                                    userData.age = int.parse(value);
                                  });
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                initialValue: _phone,
                                maxLines: 1,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Phone Number'),
                                validator: (val) {
                                  if (val.isEmpty || val.length != 11) {
                                    return 'Please enter valid number';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _phone = value;
                                    userData.phone = value;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Status:',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  DropdownButton(
                                    value: dropdownValue,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    items: <String>[
                                      'None',
                                      'High school',
                                      'Bachelor',
                                      'Maj',
                                      'PHD',
                                      'Work'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                        userData.status = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.0),
                            ],
                          ),
                        ),
                      ),
                      isActive: _currentStep > 0,
                    ),
                    Step(
                      title: Text(' '),
                      content: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 90,
                                    backgroundColor: Color(0xff476fb),
                                    child: ClipOval(
                                      child: SizedBox(
                                        width: 180.0,
                                        height: 180.0,
                                        child: (_image != null)
                                            ? Image.file(_image,
                                                fit: BoxFit.fill)
                                            : Image.network(
                                                'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
                                                fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60.0),
                                  child: IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.camera,
                                        size: 30.0,
                                      ),
                                      onPressed: () {
                                        getImage();
                                      }),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      isActive: _currentStep > 1,
                      // state: StepState.complete,
                    ),
                  ],
                  type: StepperType.horizontal,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = _currentStep;
                    });
                    // _currentStep = step;
                  },
                  onStepContinue: () {
                    setState(() {
                      if (_currentStep == 2 ||
                          formKeys[_currentStep].currentState.validate()) {
                        // formKeys[_currentStep].currentState.save();
                        if (_currentStep < 3) {
                          if (_currentStep == 1) {
                            conButton = 'Register';
                          } else if (_currentStep == 2) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = _auth.registerWithEmailAndPassword(
                                _email, _password);
                            void getId() async {
                              final FirebaseUser user =
                                  await FirebaseAuth.instance.currentUser();
                              userData.userId = user.uid.toString();
                              userServ.add(userData);
                            }

                            if (result == null) {
                              setState(() {
                                error = 'Email already used';
                                loading = false;
                              });
                            } else {
                              uploadPic(context).then((v) {
                                Navigator.of(context)
                                    .pushReplacementNamed("./login");
                              });
                              getId();
                            }
                          }
                          _currentStep = _currentStep + 1;
                        } else {
                          _currentStep = 0;
                        }
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_currentStep > 0){
                        _currentStep = _currentStep - 1;
                        conButton = 'Next';
                      }
                      else
                        _currentStep = 0;
                    });
                  },
                ),
              ),
            ),
          );
  }
}
