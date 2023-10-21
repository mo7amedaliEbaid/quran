import 'package:hesn_elmuslim/features/quran/domain/entities/quran_audio_entity.dart';
import 'package:hesn_elmuslim/features/quran/domain/entities/quran_entity.dart';

abstract class QuranStates {}

class InitialQuranState extends QuranStates {}

class GetQuranLoading extends QuranStates {}

class GetQuranSuccess extends QuranStates {
  final QuranEntity quranEntity;

  GetQuranSuccess({required this.quranEntity});
}

class GetQuranError extends QuranStates {
  final String error;

  GetQuranError({required this.error});
}

class GetQuranAudioLoading extends QuranStates {}

class GetQuranAudioSuccess extends QuranStates {
  final QuranAudioEntity quranEntity;

  GetQuranAudioSuccess({required this.quranEntity});
}

class GetQuranAudioError extends QuranStates {
  final String error;

  GetQuranAudioError({required this.error});
}
