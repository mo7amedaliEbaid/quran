import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesn_elmuslim/core/usecases/usecase.dart';
import 'package:hesn_elmuslim/core/utils/constants_manager.dart';

import '../../../../../core/error/failure.dart';
import '../../../../quran/data/models/surah_names.dart';
import '../../../domain/entities/audio_entity.dart';
import '../../../domain/usecases/recitations_usecase.dart';
import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioUsecase audioUsecase;
  AudioCubit({required this.audioUsecase}) : super(AudioInitial());

  static AudioCubit get(context) => BlocProvider.of(context);

  String reciterId = '';
  int surahId = 1;

  List<String> audiUrl = [];

  getAudioFun() async {
    SurahNames.audio.clear();
    emit(GetAudioLoadingState());

    Either<Failure, AudioEntity> response =
        await audioUsecase(AudiosParams(reciterId: reciterId));
    response.fold((failure) => emit(GetAudioErrorState(error: failure.message)),
        (audioEntity) {
      for (var element in audioEntity.audioFiles) {
        SurahNames.audio.add(element.audioUrl);
      }
      return emit(GetAudioSuccessSate(audioEntity: audioEntity));
    });
  }
      getSurahName(String name){
    emit(GetNameLoadingState());

    AppConstants.surahName = name;
    emit(GetNameSuccessState());
  }
}
