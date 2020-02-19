import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.Services/auth.dart';
import 'package:zoda/theme/input.dart';
import 'login.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  static List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

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

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xff16071e),
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
                        RaisedButton(
                          color: Color(0xff16071e),
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: Color(0xff16071e))),
                          onPressed: onStepCancel,
                          child: Text('Back',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)),
                        ),
                        RaisedButton(
                          color: Color(0xff16071e),
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: Color(0xff16071e))),
                          onPressed: onStepContinue,
                          child: Text('Next',
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
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          key: formKeys[0],
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                initialValue: _firstName,
                                onChanged: (String value) {
                                  setState(() {
                                    _firstName = value;
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
                                        : int.parse(val) >= 80
                                            ? 'your age should be smaller than 80'
                                            : null,
                                onChanged: (value) {
                                  setState(() {
                                    _age = int.parse(value);
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
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50.0),
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
                                  });
                                },
                              ),
                              SizedBox(height: 40.0),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          key: formKeys[2],
                          child: Column(
                            children: <Widget>[
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
                            ],
                          ),
                        ),
                      ),
                      isActive: true,
                    ),
                    Step(
                      title: Text(' '),
                      content: Container(
                          child: RaisedButton(
                              color: Color(0xff16071e),
                              padding: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black)),
                              child: Text(
                                '  Register  ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              onPressed: () async {})),
                      isActive: true,
                      state: StepState.complete,
                    ),
                  ],
                  type: StepperType.horizontal,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = step;
                    });
                    // _currentStep = step;
                  },
                  onStepContinue: () {
                    setState(() {
                      if (formKeys[_currentStep].currentState.validate()) {
                        formKeys[_currentStep].currentState.save();
                        if (_currentStep < 4) {
                          _currentStep = _currentStep + 1;
                        } else {
                          _currentStep = 0;
                        }
                        // if (_formKey.currentState.validate()) {
                        //   setState(() {loading = true;});
                        //   dynamic result = await _auth
                        //       .registerWithEmailAndPassword(email, password);
                        //   if (result == null) {
                        //     setState(() {
                        //       error = 'please enter a valid email';
                        //       loading = false;
                        //     });
                        //   } else {
                        //     Navigator.of(context).pushReplacementNamed('/home');
                        //   }
                        // }
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_currentStep > 0)
                        _currentStep = _currentStep - 1;
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

// List<Step> steps = [
//   Step(
//     title: Text('  '),
//     content: Container(
//       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//       child: Form(
//         key: formKeys[0],
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               decoration:
//                   textInputDecoration.copyWith(hintText: 'Fisrt name'),
//               validator: (val) =>
//                   val.isEmpty ? 'Enter your First name' : null,
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//             TextFormField(
//               decoration: textInputDecoration.copyWith(hintText: 'Last name'),
//               validator: (val) =>
//                   val.isEmpty ? 'Enter your Last name ' : null,
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//             TextFormField(
//               decoration: textInputDecoration.copyWith(hintText: 'Age'),
//               validator: (val) => val.isEmpty ? 'Enter your Age ' : null,
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 WhitelistingTextInputFormatter.digitsOnly
//               ],
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//             TextFormField(
//               decoration: textInputDecoration.copyWith(hintText: 'Password'),
//               validator: (val) =>
//                   val.length < 6 ? 'Enter n password 6+ chars long' : null,
//               obscureText: true,
//               onChanged: (val) {
//           //     setState(() => password = val);
//                 //  = val;
//               },
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//             TextFormField(
//               decoration:
//                   textInputDecoration.copyWith(hintText: 'Confirm Password'),
//               validator: (val) {
//                 if (val.isEmpty) {
//                   //|| password!=val
//               //    log(password);
//                   return 'Password not matched';
//                 }
//               },
//               obscureText: true,
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               error,
//               style: TextStyle(color: Colors.red, fontSize: 14.0),
//             ),
//           ],
//         ),
//       ),
//     ),
//     isActive: true,
//   ),
//   Step(
//     title: Text(' '),
//     content: Container(
//       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//       child: Form(
//         key: formKeys[1],
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               decoration: textInputDecoration.copyWith(hintText: 'Address'),
//               validator: (val) => val.isEmpty ? 'Enter your address' : null,
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//             TextFormField(
//                 decoration: textInputDecoration.copyWith(hintText: 'Email'),
//                 validator: (val) {
//                   if (val.isEmpty || !val.contains('@')) {
//                     return 'Please enter valid email';
//                   }
//                 }),
//             SizedBox(height: 40.0),
//             Text(
//               error,
//               style: TextStyle(color: Colors.red, fontSize: 14.0),
//             ),
//           ],
//         ),
//       ),
//     ),
//     isActive: true,
//   ),
//   Step(
//     title: Text(' '),
//     content: Container(
//       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//       child: Form(
//         key: formKeys[2],
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               maxLines: 1,
//               decoration:
//                   textInputDecoration.copyWith(hintText: 'Phone Number'),
//               validator: (val) {
//                 if (val.isEmpty || val.length != 11) {
//                   return 'Please enter valid number';
//                 }
//               },
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 WhitelistingTextInputFormatter.digitsOnly
//               ],
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               error,
//               style: TextStyle(color: Colors.red, fontSize: 14.0),
//             ),
//           ],
//         ),
//       ),
//     ),
//     isActive: true,
//   ),
//   Step(
//     title: Text(' '),
//     content: Container(
//         child: RaisedButton(
//             color: Color(0xff16071e),
//             padding: const EdgeInsets.all(10.0),
//             shape: RoundedRectangleBorder(
//                 borderRadius: new BorderRadius.circular(10.0),
//                 side: BorderSide(color: Colors.black)),
//             child: Text(
//               '  Register  ',
//               style: TextStyle(color: Colors.white, fontSize: 17),
//             ),
//             onPressed: () async {})),
//     isActive: true,
//     state: StepState.complete,
//   ),
// ];
