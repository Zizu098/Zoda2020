import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoda/components/loading/loading.dart';
import 'package:zoda/database.Services/auth.dart';
import 'package:zoda/models/userDetail.dart';
import 'login.dart';
import 'package:zoda/database.services/user.service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:zoda/screens/chat/helper/helperfunctions.dart';
import 'package:zoda/screens/chat/services/database.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//Chat Register
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) {
        if (result != null) {
          Map<String, String> userDataMap = {
            // "userName" : usernameEditingController.text,
            "userName": userData.firstName,
            // "userEmail" : emailEditingController.text
            "userEmail": userData.email
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(userData.firstName);
          HelperFunctions.saveUserEmailSharedPreference(userData.email);
          // HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);
          // HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);

          // Navigator.pushReplacement(context, MaterialPageRoute(
          //     builder: (context) => ChatRoom()
          // ));
        }
      });
    }
  }

  final AuthService _auth = AuthService();
  UserDetail userData = new UserDetail();
  UserService userServ = new UserService();
  UserService userEmailServ = new UserService();
  List<UserDetail> fetchEmails;
  static List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  Future<List<UserDetail>> fetchEmail() async {
    fetchEmails = await userEmailServ.fetchData();
  }

  void initState() {
    fetchEmail();
  }

  dynamic result;
  // File _image;
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
  File _image;
  var imageURL;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("img/register.png"),
                            fit: BoxFit.fill)),
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      // key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 80.0, right: 110.0),
                                child: Text("Create account",
                                    style: TextStyle(
                                        color: Colors.red[200],
                                        fontSize: 25.0,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Georgia')),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 80.0, bottom: 10.0 , left: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: ' Username',
                                  hintStyle: TextStyle(
                                      color: Colors.blue[200], fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  prefixIcon: Icon(Icons.person)),
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Enter n password 6+ chars long'
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 80.0, bottom: 10.0 , left: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.blue[200], fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  prefixIcon: Icon(Icons.email)),
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Enter n password 6+ chars long'
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 80.0, bottom: 10.0 , left: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.blue[200], fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Enter n password 6+ chars long'
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 80.0, bottom: 10.0 , left: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      color: Colors.blue[200], fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Enter n password 6+ chars long'
                                  : null,
                            ),
                          ),
                          //  Padding(
                          //    padding: const EdgeInsets.only(right:48.0 , left: 20.0),
                          //    child: Column(
                          //       children: [
                          //         Row(
                          //           children: <Widget>[
                          //             Flexible(
                                        
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.only(right:5.0),
                          //                   child: TextFormField(
                          //                     decoration: InputDecoration(
                                                
                          //                         hintText: 'Country',
                          //                         hintStyle: TextStyle(
                          //                             color: Colors.blue[200],
                          //                             fontSize: 15.0),
                          //                         border: OutlineInputBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(25.0)),
                          //                         prefixIcon: Icon(Icons.language)),
                          //                     obscureText: true,
                          //                     validator: (val) => val.length < 6
                          //                         ? 'Enter n password 6+ chars long'
                          //                         : null,
                          //                   ),
                          //                 ),
                          //               ), 
                                      
                          //             Flexible(
                                        
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.only(right:30.0),
                          //                   child: TextFormField(
                          //                     decoration: InputDecoration(
                          //                         hintText: 'Age',
                          //                         hintStyle: TextStyle(
                          //                             color: Colors.blue[200],
                          //                             fontSize: 15.0),
                          //                         border: OutlineInputBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(25.0)),
                          //                         prefixIcon: Icon(Icons.date_range)),
                          //                     validator: (val) => val.isEmpty
                          //                         ? 'Enter an valid email '
                          //                         : null,
                          //                   ),
                          //                 ),
                          //               ),
                                      
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //  ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 140.0, right: 70.0),
                            child: RaisedButton(
                              color: Colors.lightBlue[100],
                              padding: const EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '  Sign in  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Georgia'),
                                  ),
                                  Icon(
                                    Icons.subdirectory_arrow_right,
                                    color: Colors.red[200],
                                  )
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          
                          SizedBox(height: 40.0),
                          Text(
                            'OR Create Account with...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Georgia',
                                height: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 120.0, top: 10.0, bottom: 10.0),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue[600],
                                ),
                                Text(
                                  '  Facebook',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Georgia',
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 122.0, top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.googlePlus,
                                  color: Colors.deepOrange[200],
                                ),
                                Text(
                                  '  Google+',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Georgia',
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 122.0, top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.lightBlue[400],
                                ),
                                Text(
                                  '  Twitter',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Georgia',
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ))
              ],
            ));
  }

  Future uploadFile(_image) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('user/${_image.path}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    userData.imgUrl = await storageReference.getDownloadURL();
    return await storageReference.getDownloadURL();
  }

  Future getImage() async {
    var result = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(result.path);
      // print('Image Path $_image');
      imageURL = uploadFile(_image);
      // userData.imgUrl = imageURL;
    });

    // // UserService().getById(user.id).then((model)=> model.imgUrl = imageURL);
    // UserService().update(user.toJson(), user.id);
    // user.imgUrl = model.imgUrl;
    // });
    // imageURL = await uploadPic(image);
  }
}

//   return loading
//       ? Loading()
//       : Scaffold(
//           resizeToAvoidBottomPadding: false,
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             backgroundColor: Colors.lightBlue[900],
//             elevation: 0.0,
//             title: Text('Registration'),
//             actions: <Widget>[
//               FlatButton.icon(
//                 icon: Icon(Icons.person),
//                 textColor: Colors.white,
//                 label: Text('Login'),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Login()),
//                   );
//                 },
//               ),
//             ],
//           ),
//           body: Container(
//             child: Theme(
//               data: ThemeData(primaryColor: Color(0xfff9811e)),
//               child: Stepper(
//                 controlsBuilder: (BuildContext context,
//                     {VoidCallback onStepContinue,
//                     VoidCallback onStepCancel}) {
//                   return Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       if (_currentStep > 0)
//                         (RaisedButton(
//                           color: Colors.lightBlue[900],
//                           padding: const EdgeInsets.all(10.0),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(10.0),
//                               side: BorderSide(color: Colors.lightBlue[900])),
//                           onPressed: onStepCancel,
//                           child: Text('Back',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 17)),
//                         ))
//                       else
//                         (Visibility(
//                             visible: false,
//                             child: RaisedButton(onPressed: null))),
//                       RaisedButton(
//                         color: Colors.lightBlue[900],
//                         padding: const EdgeInsets.all(10.0),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(10.0),
//                             side: BorderSide(color: Colors.lightBlue[900])),
//                         onPressed: onStepContinue,
//                         child: Text(conButton,
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 17)),
//                       ),
//                     ],
//                   );
//                 },
//                 currentStep: this._currentStep,
//                 steps: [
//                   Step(
//                     title: Text('  '),
//                     content: Container(
//                       padding: EdgeInsets.only(bottom: 150),
//                       child: Form(
//                         key: formKeys[0],
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               // controller: usernameEditingController ?? '',
//                               initialValue: _firstName,
//                               onChanged: (String value) {
//                                 setState(() {
//                                   _firstName = value;

//                                   // userData.userId = '1';
//                                   userData.firstName = value;
//                                 });
//                               },
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Fisrt name'),
//                               validator: (val) => val.isEmpty
//                                   ? 'Enter your First name'
//                                   : null,
//                             ),
//                             SizedBox(
//                               height: 15.0,
//                             ),
//                             TextFormField(
//                               initialValue: _lastName,
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Last name'),
//                               validator: (val) => val.isEmpty
//                                   ? 'Enter your Last name '
//                                   : null,
//                               onChanged: (String value) {
//                                 setState(() {
//                                   _lastName = value;
//                                   userData.lastName = value;
//                                 });
//                               },
//                             ),
//                             SizedBox(
//                               height: 15.0,
//                             ),
//                             TextFormField(
//                               // controller: emailEditingController,
//                               initialValue: _email,
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Email'),
//                               validator: (val) {
//                                 if (!EmailValidator.validate(val)) {
//                                   return 'Please enter valid email';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {
//                                 setState(() {
//                                   _email = value;
//                                   userData.email = value;
//                                 });
//                               },
//                             ),
//                             Text(
//                               error,
//                               style: TextStyle(
//                                   color: Colors.red, fontSize: 14.0),
//                             ),
//                             TextFormField(
//                               controller: passwordEditingController,
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Password'),
//                               validator: (val) => val.length < 6
//                                   ? 'Enter password 6+ chars long'
//                                   : null,
//                               obscureText: true,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _password = value;
//                                 });
//                               },
//                             ),
//                             SizedBox(
//                               height: 15.0,
//                             ),
//                             TextFormField(
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Confirm Password'),
//                               validator: (val) => val.isEmpty
//                                   ? 'Enter the Confirm Password'
//                                   : _confirmPassword != _password
//                                       ? 'Password not matched'
//                                       : null,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _confirmPassword = value;
//                                 });
//                               },
//                               obscureText: true,
//                             ),
//                             SizedBox(height: 5.0),
//                             // Text(
//                             //   error,
//                             //   style: TextStyle(
//                             //       color: Colors.red, fontSize: 14.0),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     isActive: true,
//                   ),
//                   Step(
//                     title: Text(' '),
//                     content: Container(
//                       padding: EdgeInsets.only(bottom: 120),
//                       child: Form(
//                         key: formKeys[1],
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               initialValue: _address,
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Address'),
//                               validator: (val) =>
//                                   val.isEmpty ? 'Enter your address' : null,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _address = value;
//                                   userData.address = value;
//                                 });
//                               },
//                             ),
//                             SizedBox(
//                               height: 15.0,
//                             ),
//                             TextFormField(
//                               initialValue: _age == 0 ? "" : _age.toString(),
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Age'),
//                               validator: (val) => val.isEmpty
//                                   ? "Enter Your Age"
//                                   : int.parse(val) <= 10
//                                       ? 'your age should be greater than 10'
//                                       : int.parse(val) >= 90
//                                           ? 'your age should be smaller than 80'
//                                           : null,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _age = int.parse(value);
//                                   userData.age = value;
//                                 });
//                               },
//                               keyboardType: TextInputType.number,
//                               inputFormatters: <TextInputFormatter>[
//                                 WhitelistingTextInputFormatter.digitsOnly
//                               ],
//                             ),
//                             SizedBox(
//                               height: 15.0,
//                             ),
//                             TextFormField(
//                               initialValue: _phone,
//                               maxLines: 1,
//                               decoration: textInputDecoration.copyWith(
//                                   hintText: 'Phone Number'),
//                               validator: (val) {
//                                 if (val.isEmpty || val.length != 11) {
//                                   return 'Please enter valid number';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {
//                                 setState(() {
//                                   _phone = value;
//                                   userData.phone = value;
//                                 });
//                               },
//                               keyboardType: TextInputType.number,
//                               inputFormatters: <TextInputFormatter>[
//                                 WhitelistingTextInputFormatter.digitsOnly
//                               ],
//                             ),
//                             SizedBox(height: 5.0),
//                             // Text(
//                             //   error,
//                             //   style: TextStyle(
//                             //       color: Colors.red, fontSize: 14.0),
//                             // ),
//                             Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Text(
//                                   'Status:',
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 DropdownButton(
//                                   value: dropdownValue,
//                                   icon: Icon(Icons.arrow_drop_down),
//                                   iconSize: 24,
//                                   elevation: 16,
//                                   items: <String>[
//                                     'None',
//                                     'High school',
//                                     'Bachelor',
//                                     'Maj',
//                                     'PHD',
//                                     'Work'
//                                   ].map<DropdownMenuItem<String>>(
//                                       (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(value),
//                                     );
//                                   }).toList(),
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.black),
//                                   onChanged: (String newValue) {
//                                     setState(() {
//                                       dropdownValue = newValue;
//                                       userData.status = newValue;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 0.0),
//                           ],
//                         ),
//                       ),
//                     ),
//                     isActive: _currentStep > 0,
//                   ),
//                   Step(
//                     title: Text(' '),
//                     content: Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           SizedBox(height: 20.0),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: CircleAvatar(
//                                   radius: 90,
//                                   backgroundColor: Color(0xff476fb),
//                                   child: ClipOval(
//                                     child: SizedBox(
//                                       width: 180.0,
//                                       height: 180.0,
//                                       child: (_image != null)
//                                           ? Image.file(_image,
//                                               fit: BoxFit.fill)
//                                           : Image.network(
//                                               'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
//                                               fit: BoxFit.fill),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 60.0),
//                                 child: IconButton(
//                                     icon: Icon(
//                                       FontAwesomeIcons.camera,
//                                       size: 30.0,
//                                     ),
//                                     onPressed: () {
//                                       getImage();
//                                     }),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                         ],
//                       ),
//                     ),
//                     isActive: _currentStep > 1,
//                     // state: StepState.complete,
//                   ),
//                 ],
//                 type: StepperType.horizontal,
//                 onStepTapped: (step) {
//                   setState(() {
//                     _currentStep = _currentStep;
//                   });
//                 },
//                 onStepContinue: () {
//                   setState(() {
//                     if (_currentStep == 2 ||
//                         formKeys[_currentStep].currentState.validate()) {
//                       // formKeys[_currentStep].currentState.save();
//                       if (_currentStep < 3) {
//                         if (_currentStep == 0) {
//                           for (int i = 0; i < fetchEmails.length; i++) {
//                             if (fetchEmails[i].email == _email) {
//                               setState(() {
//                                 error = 'Email already used';
//                                 _currentStep--;
//                               });
//                             } else {
//                               setState(() {
//                                 error = '';
//                               });
//                             }
//                           }
//                         } else if (_currentStep == 1) {
//                           conButton = 'Register';
//                         } else if (_currentStep == 2) {
//                           setState(() async {
//                             loading = true;
//                             result = await _auth.registerWithEmailAndPassword(
//                                 _email, _password);
//                              //Char Reg
//                         Map<String,String> userDataMap = {
//               // "userName" : usernameEditingController.text,
//               "userName" : userData.firstName,
//               // "userEmail" : emailEditingController.text
//               "userEmail" : userData.email
//             };

//             databaseMethods.addUserInfo(userDataMap);

//             HelperFunctions.saveUserLoggedInSharedPreference(true);
//             HelperFunctions.saveUserNameSharedPreference(userData.firstName);
//             HelperFunctions.saveUserEmailSharedPreference(userData.email);

//                             // void getId() async {
//                             //  final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
//                             userData.userId = result.uid;
//                             uploadFile(_image);
//                             userServ.add(userData);
//                           });
//                         }
//                         _currentStep = _currentStep + 1;
//                       } else {
//                         _currentStep = 0;
//                       }
//                     }
//                   });
//                 },
//                 onStepCancel: () {
//                   setState(() {
//                     if (_currentStep > 0) {
//                       _currentStep = _currentStep - 1;
//                       conButton = 'Next';
//                     } else
//                       _currentStep = 0;
//                   });
//                 },
//               ),
//             ),
//           ),
//         );
// }
