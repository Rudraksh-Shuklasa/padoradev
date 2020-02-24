import 'package:flutter/material.dart';
import 'package:padora/home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.branding_watermark),
            title: Text("Brand"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text("Notification"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.memory),
            title: Text("More"),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
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
