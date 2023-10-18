import 'package:equatable/equatable.dart';
import 'package:hesn_elmuslim/features/quran_audio/domain/entities/audio_entity.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioInitial extends AudioState {
  @override
  List<Object> get props => [];
}

class GetNameLoadingState extends AudioState {
  @override
  List<Object> get props => [];
}

class GetAudioLoadingState extends AudioState {
  @override
  List<Object> get props => [];
}

class GetNameSuccessState extends AudioState {
  @override
  List<Object> get props => [];
}

class GetAudioSuccessSate extends AudioState {
  final AudioEntity audioEntity;

  const GetAudioSuccessSate({required this.audioEntity});
  @override
  List<Object> get props => [audioEntity];
}

class GetAudioErrorState extends AudioState {
  final String error;

  const GetAudioErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
