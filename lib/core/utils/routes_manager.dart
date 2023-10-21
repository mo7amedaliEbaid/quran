import 'package:flutter/material.dart';
import 'package:quran/features/main_screen.dart';
import 'package:quran/features/quran/presentation/screens/surah_screen.dart';
import 'package:quran/features/quran_audio/presentation/screens/quran_audio_screen.dart';
import '../../features/quran/presentation/screens/quran_screen.dart';
import '../../features/quran/presentation/screens/quran_surah_screen.dart';
import '../../features/quran_audio/presentation/screens/quran_just_audio_screen.dart';
import '../../features/quran_audio/presentation/screens/recitations_screen.dart';


class Routes {
  static const String homeRoute = "homeScreen";


  static const String quranRoute = "quran";
  static const String surahRoute = "surah";
  static const String quranOffRoute = "quranOff";
  static const String quranSoundRoute = "quranSound";
  static const String quranAudioRoute = "quranAudio";
  static const String recitationsRoute = "recitations";

  static const String audioRoute = "audio";

  static Route createRoute(String screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          RoutesMap.routeMap(screen),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class RoutesMap {
  static Map<String, Widget Function(BuildContext)> routesMap() {
    return {
      Routes.homeRoute: (BuildContext context) => const HomeScreen(),

      Routes.quranRoute: (BuildContext context) => const QuranSurahScreen(),
      Routes.quranOffRoute: (BuildContext context) => const QuranScreen(),
      Routes.recitationsRoute: (BuildContext context) =>
          const RecitationsScreen(),
      Routes.quranSoundRoute: (BuildContext context) =>
          const QuranAudioScreen(),
      Routes.quranAudioRoute: (BuildContext context) =>
          const QuranJustAudioScreen(),

      Routes.surahRoute: (BuildContext context) => const SurahScreen(),
    };
  }

  static Widget routeMap(String screen) {
    switch (screen) {

      case Routes.homeRoute:
        return const HomeScreen();



      case Routes.quranRoute:
        return const QuranSurahScreen();
      case Routes.quranOffRoute:
        return const QuranScreen();
      case Routes.recitationsRoute:
        return const RecitationsScreen();
      case Routes.quranSoundRoute:
        return const QuranAudioScreen();
      case Routes.quranAudioRoute:
        return const QuranJustAudioScreen();

      case Routes.surahRoute:
        return const SurahScreen();

      default:
        return const HomeScreen();
    }
  }
}
