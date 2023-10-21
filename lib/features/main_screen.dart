import 'package:flutter/material.dart';
import 'package:quran/features/quran/presentation/screens/quran_screen.dart';
import 'package:quran/features/quran/presentation/screens/quran_surah_screen.dart';

import '../core/utils/media_query_values.dart';

import 'quran_audio/presentation/screens/readers_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const ReadersScreen(),
    const QuranSurahScreen(),
    const QuranScreen(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.green,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.people_alt),
              icon: Icon(Icons.people_alt_outlined),
              label: 'القراء',
            ),
            NavigationDestination(
              icon: Icon(Icons.file_copy_outlined),
              selectedIcon: Icon(Icons.file_copy),
              label: 'القران',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.my_library_books_sharp),
              icon: Icon(Icons.my_library_books_sharp),
              label: 'المصحف',
            ),
          ],
        ),
        body: screens[currentPageIndex]);
  }
}
