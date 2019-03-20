import 'package:flutter/material.dart';
import 'package:bottom_navigation/custom_docked_fab_locations.dart';

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
        bottomNavigationBar: BottomAppBar(
          color: this.bottomAppBarColor, // this.colors['secondary'],
          clipBehavior: Clip.hardEdge,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Padding(
            padding: EdgeInsets.only(bottom: 30, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _customButtomBottomBar(
                    key: Key("vencidas"), icon: Icons.assignment, page: 0, text: "Vencidas"),
                _customButtomBottomBar(
                    key: Key("geradas"), icon: Icons.assignment, page: 1, text: "Geradas"),
                _customButtomBottomBar(
                    key: Key("pagas"), icon: Icons.assignment, page: 2, text: "Pagas"),
              ],
            ),
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: Container(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            child: Icon(Icons.assignment, color: Colors.white, size: 48),
            elevation: 6.0,
            backgroundColor: this.bottomAppBarColor,
          ),
        ),
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: _pageView());
  }

  Widget _customButtomBottomBar({Key key, IconData icon, int page, String text}) {
    return InkWell(
      onTap: () {
        // print(details.globalPosition);
        this._pageController.animateToPage(page,
          curve: Curves.easeInOut, duration: Duration(seconds: 1));
      },
      child: Column(
        key: key,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Icon(
              icon,
              size: 36,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ]
      ),
    );
  }

  void stateOfFABS(int page) {
    setState(() {
      switch (page) {
        case 0:
          this.floatingActionButtonLocation =
              CustomDockedFABLocation.rightDocked;
          this.bottomAppBarColor = this.colors['vencidas'];
          /* _redPosition = _selectPosition;
          _yellowPosition = _blockPosition;
          _greenPosition = _blockPosition; */
          break;
        case 1:
          this.floatingActionButtonLocation =
              CustomDockedFABLocation.centerDocked;
          this.bottomAppBarColor = this.colors['geradas'];
          /* _redPosition = _blockPosition;
          _yellowPosition = _selectPosition;
          _greenPosition = _blockPosition; */
          break;
        case 2:
          this.floatingActionButtonLocation =
              CustomDockedFABLocation.leftDocked;
          this.bottomAppBarColor = this.colors['pagas'];
          /* _redPosition = _blockPosition;
          _yellowPosition = _blockPosition;
          _greenPosition = _selectPosition; */
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
