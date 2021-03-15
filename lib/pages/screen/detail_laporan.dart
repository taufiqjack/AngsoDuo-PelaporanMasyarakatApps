import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:angsoduo_pelaporanmasyarakat/models/global.dart' as global;

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
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => RiwayatLaporan(),
            ));
          },
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.transparent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  tileColor: Warna.greysolid,
                  title: Row(
                    children: [
                      Text("hello"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90),
                      ),
                      Text(
                        "${global.report.date}",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        )),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${global.report.judul}"),
                      Text("${global.report.detail}"),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
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
