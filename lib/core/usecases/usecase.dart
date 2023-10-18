import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class JuzParams extends Equatable {
  final String juzId;

  const JuzParams({required this.juzId});

  @override
  List<Object?> get props => [juzId];
}

class YasserQuranParams extends Equatable {
  final int reciterNum;

  const YasserQuranParams({required this.reciterNum});

  @override
  List<Object?> get props => [reciterNum];
}

class AudiosParams extends Equatable {
  final String reciterId;

  const AudiosParams({required this.reciterId});

  @override
  List<Object?> get props => [];
}



class SurahParams extends Equatable {
  final String surahId;

  const SurahParams({
    required this.surahId,
  });

  @override
  List<Object> get props => [surahId];
}

class AudioParams extends Equatable {
  final String surahId;

  const AudioParams({
    required this.surahId,
  });

  @override
  List<Object> get props => [surahId];
}


