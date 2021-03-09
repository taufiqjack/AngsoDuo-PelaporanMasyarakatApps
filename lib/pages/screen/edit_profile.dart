import 'dart:io';

import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  File _image;
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'EDIT PROFIL',
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900)),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Warna.solidblue,
          ),
          onPressed: () {},
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.transparent,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InkWell(
                  onTap: _getFromGallery,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40.0,
                    child: CircleAvatar(
                      radius: 40.0,
                      child: ClipOval(
                        child: (_image != null)
                            ? Image.file(_image)
                            : Image.asset('assets/images/police_officer2.png'),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                // CircleAvatar(
                //     child: new Image.asset(
                //       "assets/images/police_officer2.png",
                //       fit: BoxFit.fill,
                //     ),
                //     radius: 50.0),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: 'Nama',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Nomor Telp. tidak boleh kosong!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: '08123456789',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Email tidak boleh kosong!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: 'Email',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Password tidak boleh kosong!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: 'Pasword',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Klik tombol simpan di bawah untuk menyimpan\ndata"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonTheme(
        minWidth: 400,
        height: 50,
        buttonColor: Warna.solidblue,
        child: new RaisedButton(
          child: Text(
            'SIMPAN',
            style: GoogleFonts.inter(
                textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
            _formKey.currentState.validate();
          },
        ),
      ),
    );
  }
}
