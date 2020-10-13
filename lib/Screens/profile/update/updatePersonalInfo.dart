import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/services/databaseService.dart';
import 'package:path/path.dart' as Path;

class UpdatePersonalInfo extends StatefulWidget {
  User currentUser = User();
  UpdatePersonalInfo(this.currentUser);
  @override
  _UpdatePersonalInfoState createState() => _UpdatePersonalInfoState();
}

class _UpdatePersonalInfoState extends State<UpdatePersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  DatabaseService _databaseService = DatabaseService();

  String profileImageURL;
  File _imageFile;
  String userName;
  int age;

  Future getImage() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _imageFile = image;
        profileImageURL = image.path;
      });
    });
    print(profileImageURL);
  }

  clearImage() {
    setState(() {
      _imageFile = null;
      profileImageURL = null;
    });
  }

  @override
  void initState() {
    _imageFile = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userName = this.widget.currentUser.name;
    age = this.widget.currentUser.age;
    profileImageURL = this.widget.currentUser.profileImageURL;

    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.lightGreen[50],
      content: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Personal Information",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  color: Colors.red[900],
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[300].withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: CircleAvatar(backgroundImage: loadImage()),
                  ),
                  SizedBox(width: 15.0),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 20.0,
                            color: Colors.green[800],
                          ),
                          onTap: () {
                            getImage();
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.delete,
                            size: 20.0,
                            color: Colors.green[800],
                          ),
                          onTap: () {
                            clearImage();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Container(
                child: TextFormField(
                  initialValue: userName,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name is required';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    this.userName = value;
                  },
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: this.age.toString(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Age",
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    this.age = int.parse(value);
                  },
                  validator: (value) {
                    if (int.tryParse(value) == null ||
                        int.parse(value) < 10 ||
                        int.parse(value) > 100) {
                      return 'Ivalid age';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.red[400].withOpacity(0.9),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.green[400],
                      textColor: Colors.white,
                      splashColor: Colors.green[400],
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        this.widget.currentUser.name = this.userName;
                        this.widget.currentUser.age = this.age;
                        if (_formKey.currentState.validate()) {
                          if (_imageFile != null) {
                            String imagePath = "users/" +
                                this.widget.currentUser.mobileNumber.toString() +
                                "-" +
                                Path.basename(_imageFile.path).toString();
                            _databaseService.uploadImage(
                                imagePath, _imageFile, this.widget.currentUser);
                          } else {
                            _databaseService.createUser(this.widget.currentUser);
                          }
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadImage() {
    if (profileImageURL == null && _imageFile == null) {
      return AssetImage("images/profile.jpg"); // load defaluld icon
    } else if (_imageFile != null) {
      return AssetImage(_imageFile.path); // load selected image
    } else {
      return AssetImage("images/profile.jpg"); // load from database
    }
  }
}
