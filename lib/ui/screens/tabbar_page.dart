import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:naguib_selim/ui/screens/categories_page.dart';
import 'package:naguib_selim/ui/screens/home_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //New
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CategoriesPage(),
    Icon(
      Icons.chat,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  //New
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
