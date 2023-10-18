import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/audio_entity.dart';
import '../../domain/entities/recitations_entity.dart';
import '../../domain/repositories/recitations_repository.dart';
import '../datasorces/recitations_remote_datasource.dart';

class RecitationsRepositoryImpl implements RecitationsRepository {
  final NetworkInfo networkInfo;
  final RecitationsRemoteDataSource recitationsRemoteDataSource;

  RecitationsRepositoryImpl(
      {required this.networkInfo, required this.recitationsRemoteDataSource});

  @override
  Future<Either<Failure, RecitationsEntity>> recitations(surah) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRecitations =
            await recitationsRemoteDataSource.recitations();
        if (remoteRecitations.recitations.isNotEmpty) {
          return Right(remoteRecitations);
        } else {
          return Left(Failure(400, 'Empty List'));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AudioEntity>> audio(params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAudio = await recitationsRemoteDataSource.audio(
            reciterId: params.reciterId);
        if (remoteAudio.audioFiles.isNotEmpty) {
          return Right(remoteAudio);
        } else {
          return Left(Failure(400, 'Empty List'));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
