import 'package:flutter/material.dart';
import 'package:quran/features/quran/presentation/screens/quran_screen.dart';
import 'package:quran/features/quran/presentation/screens/quran_surah_screen.dart';

import '../core/utils/media_query_values.dart';

import 'quran_audio/presentation/screens/recitations_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const RecitationsScreen(),
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
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'القران',
            ),
            NavigationDestination(
              icon: Icon(Icons.audio_file),
              label: 'القراءة',
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
