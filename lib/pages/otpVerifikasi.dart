import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/loginAfterOtp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifikasiOTP extends StatefulWidget {
  VerifikasiOTP({Key key}) : super(key: key);

  @override
  _VerifikasiOTPState createState() => _VerifikasiOTPState();
}
TextEditingController _otpController = TextEditingController();

AuthCredential _phoneAuthCredential;
String _verificationId;
class _VerifikasiOTPState extends State<VerifikasiOTP> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    var noHp = '';
    bool hasError = false;


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
                    'assets/images/group4.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'VERIFIKASI OTP',
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text('Masukkan kode OTP yang dikirimkan ke nomor'),
                  Text('handphone anda : $noHp'),
                  Padding(padding: EdgeInsets.all(10)),
                  _boxBuilder(),
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
            'VERIFIKASI',
            style: GoogleFonts.inter(
                textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginAfterOTP(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _boxBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _box(),
        _box(),
        _box(),
        _box(),
      ],
    );
  }

  Widget _box() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 6,
      child: TextField(
        controller: _otpController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLength: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: const EdgeInsets.all(20)),
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
    );
  }
}
