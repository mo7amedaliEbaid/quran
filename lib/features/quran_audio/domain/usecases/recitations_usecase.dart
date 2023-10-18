import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/audio_entity.dart';
import '../entities/recitations_entity.dart';
import '../repositories/recitations_repository.dart';

class RecitationsUsecase implements UseCase<RecitationsEntity, NoParams> {
  final RecitationsRepository recitationsRepository;

  RecitationsUsecase(this.recitationsRepository);

  @override
  Future<Either<Failure, RecitationsEntity>> call(NoParams params) =>
      recitationsRepository.recitations(params);
}

class AudioUsecase implements UseCase<AudioEntity, AudiosParams> {
  final RecitationsRepository recitationsRepository;

  AudioUsecase(this.recitationsRepository);

  @override
  Future<Either<Failure, AudioEntity>> call(AudiosParams params) =>
      recitationsRepository.audio(params);
}
