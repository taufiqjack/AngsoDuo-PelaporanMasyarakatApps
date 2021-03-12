import 'package:angsoduo_pelaporanmasyarakat/pages/login.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var waktu = Waktu();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Column(
              children: [
                Text(
                  'LAPOR MASYARAKAT',
                  style: GoogleFonts.inter(
                      color: Colors.black, fontWeight: FontWeight.w900),
                ),
                Text(
                  '${waktu.yMMMMEEEEd()}',
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          actions: [
            PopupMenuButton(
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
              itemBuilder: (_) => <PopupMenuItem>[
                new PopupMenuItem(
                  child: Text('Profil'),
                  value: 0,
                ),
                new PopupMenuItem(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                    value: 1),
              ],
              onSelected: (result) {
                if (result == 0) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProfilePage(),
                    ),
                  );
                } else if (result == 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginApp(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
