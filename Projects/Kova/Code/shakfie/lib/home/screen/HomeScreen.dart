import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakfie/cardlist/screen/CardListScreen.dart';
import 'package:shakfie/receiptlist/screen/ReceiptListScreen.dart';
import 'package:shakfie/scancode/screen/ScanCodeScreen.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screens = [
    ScanCodeScreen(),
    CardListScreen(false),
    ReceiptListScreen()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.creditCard),
            title: Text('Cards'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.receipt),
            title: Text('Receipts'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _changeScreen,
      ),
    );
  }
  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
