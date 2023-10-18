import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/routes_manager.dart';
import 'package:hesn_elmuslim/core/utils/strings_manager.dart';

import 'package:hesn_elmuslim/features/quran/presentation/quran_off/quran_off_cubit.dart';
import 'core/local/cache_helper.dart';
import 'core/utils/theme_manager.dart';
import 'features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'features/quran_audio/presentation/controller/aduio_cubit/audio_cubit.dart';
import 'features/quran_audio/presentation/controller/recitations_cubit/recitations_cubit.dart';
import 'di/di.dart';
import 'di/di.dart' as di;
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await CacheHelper.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuranOffCubit()),
        BlocProvider(create: (context) => sl<QuranCubit>()),
        BlocProvider(create: (context) => sl<SurahCubit>()),
        BlocProvider(create: (context) => sl<RecitationsCubit>()),
        BlocProvider(create: (context) => sl<AudioCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(400, 860),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, widgets) => MaterialApp(
          title: AppStrings.appName,

          routes: RoutesMap.routesMap(),
          builder: (context, widget) {

            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: widget!,
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          initialRoute: Routes.homeRoute,
        ),
      ),
    );
  }
}
