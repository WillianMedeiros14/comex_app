import 'package:comex_app/features/home/home_screen.dart';
import 'package:comex_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    OnboardingScreen(),
    HomeScreen(),
    OnboardingScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60.0),
                topRight: Radius.circular(60.0),
                bottomLeft: Radius.circular(60.0),
                bottomRight: Radius.circular(60.0),
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                iconSize: 40,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.white38,
                selectedItemColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'List',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
