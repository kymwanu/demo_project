// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavoritesScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/main_icons/home.png',
              color: Colors.grey,
              height: 35,
              width: 40,
            ),
            activeIcon: Image.asset(
              'assets/icons/main_icons/home.png',
              color: Colors.blue,
              height: 35,
              width: 40,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/main_icons/favorite.png',
              color: Colors.grey,
              height: 35,
              width: 40,
            ),
            activeIcon: Image.asset(
              'assets/icons/main_icons/favorite.png',
              color: Colors.blue,
              height: 35,
              width: 40,
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/main_icons/search.png',
              color: Colors.grey,
              height: 35,
              width: 40,
            ),
            activeIcon: Image.asset(
              'assets/icons/main_icons/search.png',
              color: Colors.blue,
              height: 35,
              width: 40,
            ),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/main_icons/person.png',
              color: Colors.grey,
              height: 35,
              width: 40,
            ),
            activeIcon: Image.asset(
              'assets/icons/main_icons/person.png',
              color: Colors.blue,
              height: 35,
              width: 40,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
