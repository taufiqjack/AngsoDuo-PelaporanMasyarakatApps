import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/login.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:format_indonesia/format_indonesia.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String listMenu;
  var waktu = Waktu();
  // PersistentTabController _controller;
  List _menu = ['Profil', 'Logout'];

  @override
  Widget build(BuildContext context) {
    // _controller = PersistentTabController(initialIndex: 0);
    return Scaffold(
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
      body: Center(
        child: Text("Hello World"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlatButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Icon(Icons.dashboard_outlined),
                      new Text('Dashboard')
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: new Text(''),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Icon(Icons.history),
                      new Text('Riwayat'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/megaphone.png'),
              Text('Lapor'),
            ],
          ),
          backgroundColor: Warna.warmpink,
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
