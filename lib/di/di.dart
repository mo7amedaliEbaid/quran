import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api/api_consumer.dart';
import '../core/api/app_interceptors.dart';
import '../core/api/dio_consumer.dart';
import '../core/network/network_info.dart';
import '../features/quran/data/datasources/quran_remote_datasource.dart';
import '../features/quran/data/repositories/quran_repository_impl.dart';
import '../features/quran/domain/repositories/quran_repository.dart';
import '../features/quran/domain/usecases/quran_usecase.dart';
import '../features/quran/presentation/quran_cubit/quran_cubit.dart';
import '../features/quran/presentation/surah_cubit/surah_cubit.dart';
import '../features/quran_audio/data/datasorces/recitations_remote_datasource.dart';
import '../features/quran_audio/data/repositories/recitations_repostiory_impl.dart';
import '../features/quran_audio/domain/repositories/recitations_repository.dart';
import '../features/quran_audio/domain/usecases/recitations_usecase.dart';
import '../features/quran_audio/presentation/controller/aduio_cubit/audio_cubit.dart';
import '../features/quran_audio/presentation/controller/recitations_cubit/recitations_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  ///////////////////////////////////////////////////////// Blocs//////////////////////////////////////////////////


  sl.registerLazySingleton<QuranCubit>(
      () => QuranCubit(quranUsecase: sl(), quranAudioUsecase: sl()));
  sl.registerLazySingleton<SurahCubit>(() => SurahCubit(surahUsecase: sl()));
  sl.registerLazySingleton<RecitationsCubit>(
      () => RecitationsCubit(recitationsUsecase: sl()));
  sl.registerLazySingleton<AudioCubit>(() => AudioCubit(audioUsecase: sl()));



  //*****************************************// Use cases \\**************************************\\


  sl.registerLazySingleton<QuranUsecase>(() => QuranUsecase(sl()));
  sl.registerLazySingleton<QuranAudioUsecase>(() => QuranAudioUsecase(sl()));
  sl.registerLazySingleton<SurahUsecase>(() => SurahUsecase(sl()));
  sl.registerLazySingleton<RecitationsUsecase>(() => RecitationsUsecase(sl()));
  sl.registerLazySingleton<AudioUsecase>(() => AudioUsecase(sl()));



///////////////////**************************** // Repository //*****************************************//////////////////////


  sl.registerLazySingleton<QuranRepository>(() => QuranRepositoryImpl(
        quranRemoteDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<RecitationsRepository>(
      () => RecitationsRepositoryImpl(
            recitationsRemoteDataSource: sl(),
            networkInfo: sl(),
          ));



///////////////////***************************// Data Sources //**********************************************///////////////////



  sl.registerLazySingleton<QuranRemoteDataSource>(
      () => QuranRemoteDataSourceImpl(
            apiConsumer: sl(),
          ));

  sl.registerLazySingleton<RecitationsRemoteDataSource>(
      () => RecitationsRemoteDataSourceImpl(
            apiConsumer: sl(),
          ));





  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
