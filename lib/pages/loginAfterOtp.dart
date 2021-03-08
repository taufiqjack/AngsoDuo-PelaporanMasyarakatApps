import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAfterOTP extends StatefulWidget {
  LoginAfterOTP({Key key}) : super(key: key);

  @override
  _LoginAfterOTPState createState() => _LoginAfterOTPState();
}

class _LoginAfterOTPState extends State<LoginAfterOTP> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 24.0, 24.0, 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/police_officer.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'LAPOR MASYARAKAT APP',
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Silahkan masuk ke Angso Duo App untuk',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'melaporkan kegiatan kriminal, kasus covid,',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'kecelakaan lalu lintas dan kebakaran di sekitar',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'anda.',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
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
                      hintText: 'Masukkan Nama',
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    textInputAction: TextInputAction.next,
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
                      hintText: 'Masukkan Password',
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
                        return 'Ulangi Password tidak boleh kosong!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      hintText: 'Masukkan Kembali Password',
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
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
            'LOGIN',
            style: GoogleFonts.inter(
                textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
