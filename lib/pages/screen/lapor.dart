import 'dart:io';

import 'package:angsoduo_pelaporanmasyarakat/controller/user_details.dart';
import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/homepage.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/status.dart';
import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:angsoduo_pelaporanmasyarakat/models/global.dart' as global;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LaporanPage extends StatefulWidget {
  LaporanPage({Key key}) : super(key: key);

  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool showProgress = false;

  var waktu = Waktu();

  File img;
  _getFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      img = image;
    });
  }

  final _dateController = Waktu();
  final _judulController = TextEditingController();
  final _detailController = TextEditingController();
  final _fotoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'BUAT LAPORAN',
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
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.transparent,
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 24, 8),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Sampaikan laporan Anda langsung kepada'),
                    Text('kepolisian daerah Jambi melalui form dibawah ini.'),
                    Padding(padding: EdgeInsets.all(20)),
                    TextFormField(
                      controller: _judulController,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'judul laporan tidak boleh kosong!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: 'Masukkan judul laporan',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: _detailController,
                      textAlign: TextAlign.start,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 60),
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: 'Masukkan detail kejadian',
                        suffixIcon: Icon(Icons.mic_none),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    img != null
                        ? Image.asset(
                            img.path,
                            height: 150,
                          )
                        : Container(height: 10),
                    Padding(padding: EdgeInsets.all(5)),
                    ButtonTheme(
                      height: 50,
                      minWidth: 100,
                      child: FlatButton(
                        onPressed: () {
                          _getFromGallery();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Warna.solidblue,
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              'TAMBAHKAN FOTO',
                              style: TextStyle(color: Warna.solidblue),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Warna.solidblue),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      bottomNavigationBar: ButtonTheme(
        minWidth: 400,
        height: 50,
        buttonColor: Warna.solidblue,
        child: new RaisedButton(
          child: Text(
            'LAPORKAN',
            style: GoogleFonts.inter(
                textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              setState(() {
                showProgress = true;
                global.report.date = waktu.yMMMMEEEEd();
                global.report.judul = _judulController.text;
                global.report.detail = _detailController.text;
                global.report.foto = _fotoController.text;
                detailUser();
                // detailUser();
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => StatusLaporan(),
                    ),
                  );
                });
              });
            }
          },
        ),
      ),
    );
  }
}
