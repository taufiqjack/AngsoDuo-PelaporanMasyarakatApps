import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailLaporan extends StatefulWidget {
  DetailLaporan({Key key}) : super(key: key);

  @override
  _DetailLaporanState createState() => _DetailLaporanState();
}

class _DetailLaporanState extends State<DetailLaporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'DETAIL LAPORAN',
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
          ),
        ],
      ),
      body: Center(
        child: Text("halo"),
      ),
      bottomNavigationBar: ButtonTheme(
        minWidth: 400,
        height: 50,
        buttonColor: Warna.warmpink,
        child: new RaisedButton(
          child: Text(
            'BATALKAN PELAPORAN',
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Warna.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800)),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {},
        ),
      ),
    );
  }
}
