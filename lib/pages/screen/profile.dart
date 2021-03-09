import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'PROFIL',
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
          padding: EdgeInsets.fromLTRB(20, 24, 24, 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                    child: new Image.asset(
                      "assets/images/police_officer2.png",
                      fit: BoxFit.fill,
                    ),
                    radius: 50.0),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey)),
                  child: Text("Nama saya"),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey)),
                  child: Text("08123456789"),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey)),
                  child: Text("taufiqjack@gmail.com"),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey)),
                  child: Text("*****"),
                ),
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
            'EDIT PROFIL',
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
