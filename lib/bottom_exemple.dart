import 'package:flutter/material.dart';
import 'package:bottom_navigation/custom_docked_fab_locations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomExemple extends StatefulWidget {
  @override
  _BottomExempleState createState() => _BottomExempleState();
}

class _BottomExempleState extends State<BottomExemple> {
  FloatingActionButtonLocation floatingActionButtonLocation =
      CustomDockedFABLocation.rightDocked;

  final Map<String, Color> colors = {
    'primary': Colors.green[300],
    'secondary': Colors.orange,
    'vencidas': Colors.red,
    'geradas': Colors.yellow,
    'pagas': Colors.green,
  };

  Color bottomAppBarColor = Colors.red;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          
          initialIndex: 0,
          color: this.bottomAppBarColor,
          backgroundColor: Colors.white,
          items: <Widget>[
            Icon(Icons.assignment, size: 48, color: Colors.white,),
            Icon(Icons.assignment, size: 48, color: Colors.white,),
            Icon(Icons.assignment, size: 48, color: Colors.white,)
          ],
          onTap: (index) {
            this._pageController.animateToPage(index, curve: Curves.easeInOut, duration: Duration(seconds: 1));
          },
        ),
        body: _pageView());
  }

  void stateOfFABS(int page) {
    setState(() {
      switch (page) {
        case 0:
          this.bottomAppBarColor = this.colors['vencidas'];
          break;
        case 1:
          this.bottomAppBarColor = this.colors['geradas'];
          break;
        case 2:
          this.bottomAppBarColor = this.colors['pagas'];
          break;
        default:
      }
    });
  }

  Widget _pageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (page) {
        stateOfFABS(page);
      },
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'Faturas\nVencidas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'Faturas\nGeradas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'Faturas\nPagas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
