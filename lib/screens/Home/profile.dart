import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:zoda/database.services/user.service.dart';
import 'package:zoda/models/userDetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:zoda/components/loading/loading.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  final dio = new Dio();

  UserDetail user;
  String userId;
  UserService _userService = new UserService();

  Future<void> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      userId = userData.uid;
      //user = _userService.getById(userId);
    });
    _userService.getById(userId).then((value) => {
          this.setState(() {
            user = value;
          }),
          print(user)
        });
    //AuthService auth = new AuthService();
    //User currentUser = auth.currentUSer();
  }

  // @override
  // void initState() {
  //   getUserData();
  //   super.initState();
  // }
  //Future<DocumentSnapshot> data = getDocumentById(user);

// Upload Image
  File _image;
  String fileName;
  var url;
  var imageURL;
  Future getImage() async {
    var result = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(result.path);
      print('Image Path $_image');
    });
    imageURL = await uploadFile(_image);
    user.imgUrl = imageURL;
    // UserService().getById(user.id).then((model)=> model.imgUrl = imageURL);
    // UserService().update(user.toJson(), user.id);
    // user.imgUrl = model.imgUrl;
    // });
    // imageURL = await uploadPic(image);
  }

  Future uploadFile(_image) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('User/${_image.path}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    return await storageReference.getDownloadURL();
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  void _performSave() {
    user.firstName = _nameController.text;
    user.email = _emailController.text;
    user.age = _ageController.text;
    user.phone = _phoneController.text;
    user.address = _addressController.text;
    // user.imgUrl = await uploadFile(_image);
    var uResult = _userService.update(user, user.userId);
  }

  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  bool _enableEdit = false;
  var iconEdit = Icons.edit;
  Color colorEdit = Colors.lightBlue[900];
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    Loading();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: ScrollPhysics(),

            //  item: (BuildContext context, index) {
            // if (user == null) return Loading();
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        // backgroundImage: (_image != null) ? FileImage(_image)
                        //                      :NetworkImage(user.imgUrl),
                        backgroundColor: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30.0,
                            ),
                            onPressed: () {
                              getImage();
                              // chooseFile();
                            }),
                      )
                    ]),
              ),
              Container(
                child: Form(
                  key: _formKeyValue,
                  autovalidate: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        enabled: _enableEdit,
                        decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.userCircle,
                            color: Colors.lightBlue[900],
                          ),
                          hintText: 'First Name',
                          labelText: "Name",
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Name is required';
                          }
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        enabled: _enableEdit,
                        decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.envelope,
                            color: Colors.lightBlue[900],
                          ),
                          hintText: 'Email',
                          labelText: 'Email',
                        ),
                        validator: (String value) {
                          if (!EmailValidator.validate(value)) {
                            return 'Enter valid email';
                          }
                        },
                      ),
                      TextFormField(
                        controller: _ageController,
                        enabled: _enableEdit,
                        decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.lightBlue[900],
                          ),
                          hintText: 'Age',
                          labelText: 'Age',
                        ),
                      ),
                      TextFormField(
                        controller: _phoneController,
                        enabled: _enableEdit,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone_android,
                            color: Colors.lightBlue[900],
                          ),
                          hintText: 'Phone',
                          labelText: 'Phone',
                        ),
                      ),
                      TextFormField(
                        controller: _addressController,
                        enabled: _enableEdit,
                        decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.addressCard,
                            color: Colors.lightBlue[900],
                          ),
                          hintText: 'Address',
                          labelText: 'adress',
                        ),
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1930),
                                  lastDate: DateTime(2020))
                              .then((date) {
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Address is required';
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 195.0, top: 10.0, bottom: 10.0),
                        child: RaisedButton(
                          onPressed: () {
                            _enableEdit = !_enableEdit;
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(60.0),
                          ),
                          color: Colors.lightBlue[700],
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
