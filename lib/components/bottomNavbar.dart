import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> pages;

  const BottomNavBar({super.key, required this.pages});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color(0xFFFAF2E9),
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 150, 59),
        unselectedItemColor: Colors.black45,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
      body: widget.pages[selectedIndex],
    );
  }
}
