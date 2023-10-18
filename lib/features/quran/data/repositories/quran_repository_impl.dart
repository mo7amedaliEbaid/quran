import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/quran_audio_entity.dart';
import '../../domain/entities/quran_entity.dart';
import '../../domain/entities/surah_entity.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/quran_remote_datasource.dart';

class QuranRepositoryImpl implements QuranRepository {
  final NetworkInfo networkInfo;
  final QuranRemoteDataSource quranRemoteDataSource;

  QuranRepositoryImpl(
      {required this.networkInfo, required this.quranRemoteDataSource});

  @override
  Future<Either<Failure, QuranEntity>> quran(noParams) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuran = await quranRemoteDataSource.quran();
        if (remoteQuran.data.isNotEmpty) {
          return Right(remoteQuran);
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
  Future<Either<Failure, SurahEntity>> surah(surah) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuran = await quranRemoteDataSource.surah(
          surahId: surah.surahId,
        );
        if (remoteQuran.data.ayahs.isNotEmpty) {
          return Right(remoteQuran);
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
  Future<Either<Failure, QuranAudioEntity>> audio(surah) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuran = await quranRemoteDataSource.audio(
          surahId: surah.surahId,
        );
        if (remoteQuran.audioFileEntity.audioUrl.isNotEmpty) {
          return Right(remoteQuran);
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
