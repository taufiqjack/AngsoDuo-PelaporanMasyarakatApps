import 'package:angsoduo_pelaporanmasyarakat/custom/warna.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/dashboard.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/lapor.dart';
import 'package:angsoduo_pelaporanmasyarakat/pages/screen/riwayat.dart';
import 'package:flutter/material.dart';
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
  int _currentIndex = 0;
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // _controller = PersistentTabController(initialIndex: 0);
    return Scaffold(
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {},
        children: [
          DashboardPage(),
          RiwayatLaporan(),
        ],
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
                  onPressed: () {
                    _myPage.jumpToPage(0);
                  },
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
                  onPressed: () {
                    _myPage.jumpToPage(1);
                  },
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
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LaporanPage()));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _showPage = new DashboardPage();

  _pageChoose(int page) {
    switch (page) {
      case 0:
        return DashboardPage();
        break;
      case 1:
        return RiwayatLaporan();
        break;
    }
  }
}
