import 'package:dartz/dartz.dart';
import 'package:hesn_elmuslim/features/quran/domain/entities/quran_audio_entity.dart';
import 'package:hesn_elmuslim/features/quran/domain/repositories/quran_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quran_entity.dart';
import '../entities/surah_entity.dart';

class QuranUsecase implements UseCase<QuranEntity, NoParams> {
  final QuranRepository quranRepository;

  QuranUsecase(this.quranRepository);

  @override
  Future<Either<Failure, QuranEntity>> call(NoParams params) =>
      quranRepository.quran(params);
}

class SurahUsecase implements UseCase<SurahEntity, SurahParams> {
  final QuranRepository quranRepository;

  SurahUsecase(this.quranRepository);

  @override
  Future<Either<Failure, SurahEntity>> call(SurahParams params) =>
      quranRepository.surah(params);
}

class QuranAudioUsecase implements UseCase<QuranAudioEntity, AudioParams> {
  final QuranRepository quranRepository;

  QuranAudioUsecase(this.quranRepository);

  @override
  Future<Either<Failure, QuranAudioEntity>> call(AudioParams params) =>
      quranRepository.audio(params);
}
