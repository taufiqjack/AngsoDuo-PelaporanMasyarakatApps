import 'package:angsoduo_pelaporanmasyarakat/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Lapor'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Riwayat'),
          )
        ],
      ),
    );
  }
}
