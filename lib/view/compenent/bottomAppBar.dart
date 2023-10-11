import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });

      // İlgili sayfaya yönlendirme yapın
      if (index == 0) {
        Navigator.pushNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushNamed(context, '/randevular');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/profile');
      }
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Randevularım',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_sharp),
          label: 'Menü',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: ProjectColors.green, // Seçilen öğenin rengi
      onTap: _onItemTapped,
      // Öğelere tıklandığında çalışacak işlev
    );
  }
}
