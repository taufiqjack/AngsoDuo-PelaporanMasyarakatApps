import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrasi extends StatefulWidget {
  Registrasi({Key key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    'assets/images/police_officer2.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'REGISTRASI AKUN',
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
                    'melaporkan kegiatan kriminal, kasus covid, dan',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'kebakaran hutan di sekitar anda.',
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
                        return 'NIK tidak boleh kosong!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      hintText: 'Masukkan NIK',
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
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: [
                      Text('Sudah punya akun?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => LoginApp(),
                            ),
                          );
                        },
                        child: Text('Login disini'),
                      ),
                    ],
                  )
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
            'Register',
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
