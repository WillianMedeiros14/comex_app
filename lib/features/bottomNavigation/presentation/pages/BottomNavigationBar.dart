import 'package:comex_app/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:comex_app/features/home/presentation/pages/home_screen.dart';
import 'package:comex_app/features/orderCart/presentation/pages/order_cart_screen.dart';
import 'package:comex_app/features/orderHistory/presentation/pages/order_history_screen.dart';
import 'package:comex_app/features/profle/presentation/pages/profile_screen.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

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
    FavoritesScreen(),
    OrderCartScreen(),
    OrderHistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

    return SafeArea(
      child: Stack(
        children: [
          _pages[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
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
                      icon: const Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite),
                      label: 'Favorites',
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        children: [
                          const Icon(Icons.shopping_cart),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Observer(builder: (_) {
                                return Text(
                                  '${cartStore.totalItems}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      label: 'Cart',
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.list),
                      label: 'List',
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: 'Profile',
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
