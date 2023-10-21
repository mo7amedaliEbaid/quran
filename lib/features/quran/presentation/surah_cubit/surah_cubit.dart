import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesn_elmuslim/core/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/surah_entity.dart';
import '../../domain/usecases/quran_usecase.dart';
import 'surah_state.dart';

class SurahCubit extends Cubit<SurahStates> {
  final SurahUsecase surahUsecase;

  SurahCubit({required this.surahUsecase}) : super(InitialSurahState());

  static SurahCubit get(context) => BlocProvider.of(context);

  String surahId = '';
  String surahName = '';

  getSurahFun() async {
    emit(GetQuranSurahLoading());

    Either<Failure, SurahEntity> response =
        await surahUsecase(SurahParams(surahId: surahId));
    response.fold((failure) => emit(GetQuranSurahError(error: failure.message)),
        (surahEntity) => emit(GetQuranSurahSuccess(surahEntity: surahEntity)));
  }
}
