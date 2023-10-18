import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/audio_entity.dart';
import '../entities/recitations_entity.dart';

abstract class RecitationsRepository {
  Future<Either<Failure, RecitationsEntity>> recitations(NoParams params);
  Future<Either<Failure, AudioEntity>> audio(AudiosParams params);
}
