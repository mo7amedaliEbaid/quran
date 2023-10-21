import 'package:dartz/dartz.dart';
import 'package:quran/core/usecases/usecase.dart';
import 'package:quran/features/quran/domain/entities/quran_audio_entity.dart';
import 'package:quran/features/quran/domain/entities/surah_entity.dart';
import '../../../../core/error/failure.dart';
import '../entities/quran_entity.dart';

abstract class QuranRepository {
  Future<Either<Failure, QuranEntity>> quran(NoParams params);
  Future<Either<Failure, SurahEntity>> surah(SurahParams params);
  Future<Either<Failure, QuranAudioEntity>> audio(AudioParams params);
}
