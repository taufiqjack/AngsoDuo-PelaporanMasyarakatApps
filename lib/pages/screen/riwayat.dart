import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatLaporan extends StatefulWidget {
  RiwayatLaporan({Key key}) : super(key: key);

  @override
  _RiwayatLaporanState createState() => _RiwayatLaporanState();
}

class _RiwayatLaporanState extends State<RiwayatLaporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Column(
            children: [
              Text(
                'RIWAYAT LAPORAN',
                style: GoogleFonts.inter(
                    color: Colors.black, fontWeight: FontWeight.w900),
              ),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 24, 24, 8),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: new Text(
                    'coba',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
