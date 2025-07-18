import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'menu_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;

  void changeTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screen = [HomeScreen(), MenuScreen()];

    return Scaffold(
      body: _screen[_index],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _index,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black54,
          onTap: (index) => setState(() {
            _index = index;
          }),

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: '메뉴'),
          ],
        ),
      ),
    );
  }
}
