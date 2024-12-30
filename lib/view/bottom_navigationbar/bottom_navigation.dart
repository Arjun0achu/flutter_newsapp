import 'package:flutter/material.dart';
import 'package:flutter_newsapp/view/explore_screen/explore_screen.dart';
import 'package:flutter_newsapp/view/home_screen/home_screen.dart';
import 'package:flutter_newsapp/view/profile_screen/profile_screen.dart';
import 'package:flutter_newsapp/view/watch_list_screen/watch_list_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int slectedscreen = 0; 

  final List<Widget> screens = [
    HomeScreen(),
   ExploreScreen(),
 WatchListScreen(), 
    ProfileScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[slectedscreen], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: slectedscreen, 
        onTap: (index) {
          setState(() {
            slectedscreen = index; 
          });
        },        backgroundColor:  Color(0xff151d26), 
        selectedItemColor: Colors.blue, 
        unselectedItemColor: Colors.grey, 
        showSelectedLabels: true, 
        showUnselectedLabels: true, 
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), 
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal), 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.black,),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined,color: Colors.black,),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined,color: Colors.black,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
