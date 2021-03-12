import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/homepage.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/registrasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:angsoduo_pelaporanmasyarakat/models/global.dart' as global;
import 'otpVerifikasi.dart';

class LoginApp extends StatefulWidget {
  LoginApp({Key key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _nikController = TextEditingController();

  String _status;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;

  void _handleError(e) {
    print(e.message);
    setState(() {
      _status += e.message + '\n';
    });
  }

  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: Center(
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
                      'LOGIN KE ANGSO DUO APP',
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
                      onChanged: (value) {
                        email = value; // get value from TextField
                      },
                      keyboardType: TextInputType.number,
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
                      onChanged: (value) {
                        password = value; // get value from TextField
                      },
                      obscureText: true,
                      // controller: _phoneNumberController,
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
                        Text('Belum punya akun?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Registrasi()));
                          },
                          child: Text('Daftar disini'),
                        ),
                      ],
                    )
                  ],
                ),
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
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  showProgress = true;
                });
                try {
                  global.user.nik = email;
                  global.user.noTelp = password;

                  final newUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  print(newUser.toString());
                  if (newUser != null) {
                    Fluttertoast.showToast(
                        msg: "Login Successfull",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {
                      showProgress = false;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ));
                  }
                } catch (e) {}
              }
            }),
      ),
    );
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = _phoneNumberController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more readable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');

      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(FirebaseAuthException error) {
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(milliseconds: 10000),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void _submitOTP() {
    String smsCode = _otpController.text.toString().trim();
    this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this._verificationId, smsCode: smsCode);
  }
}
