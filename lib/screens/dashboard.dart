import 'package:flutter/material.dart';
import 'package:movie_player/screens/home_screen.dart';
import 'package:movie_player/screens/play_list.dart';
import 'package:movie_player/screens/profile.dart';
import 'package:movie_player/screens/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _current_index = 0;

  List<Widget> _bottomNavigation_screen = [
    HomeScreen(),
    PlayListScreen(),
    SearchScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //َAdd Bottom Naviagation To Project

        appBar: null,  

        body: _bottomNavigation_screen.elementAt(_current_index),

        bottomNavigationBar: Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Color(0xff09090F),
      ), // sets the inactive color of the `BottomNavigationBar`
      child: BottomNavigationBar(
         fixedColor: Colors.white,
         type: BottomNavigationBarType.fixed,
         unselectedItemColor: Color(0xff51535D),
        currentIndex: _current_index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: ''),
        ],
        onTap: ItemClick,
       
      ),
    ));
  }

  void ItemClick(int index) {
    setState(() {
      _current_index = index;
    });
  }
}
