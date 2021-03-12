import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/detail_laporan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusLaporan extends StatefulWidget {
  StatusLaporan({Key key}) : super(key: key);

  @override
  _StatusLaporanState createState() => _StatusLaporanState();
}

class _StatusLaporanState extends State<StatusLaporan> {
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
                    'assets/images/group24.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'LAPORAN SUKSES TERKIRIM',
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Terima kasih atas laporan anda. Command center',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'polda Jambi akan menindaklanjuti laporan anda',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'sesegera mungkin.',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w400),
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
            'LANJUTKAN',
            style: GoogleFonts.inter(
                textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DetailLaporan(),
            ));
          },
        ),
      ),
    );
  }
}
