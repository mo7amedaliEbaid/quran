import 'package:hesn_elmuslim/features/quran/domain/entities/surah_entity.dart';

abstract class SurahStates {}

class InitialSurahState extends SurahStates {}

class GetQuranSurahLoading extends SurahStates {}

class GetQuranSurahSuccess extends SurahStates {
  final SurahEntity surahEntity;

  GetQuranSurahSuccess({required this.surahEntity});
}

class GetQuranSurahError extends SurahStates {
  final String error;

  GetQuranSurahError({required this.error});
}
