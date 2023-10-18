import 'package:equatable/equatable.dart';

class QuranAudioEntity extends Equatable {
  final AudioFileEntity audioFileEntity;

  const QuranAudioEntity({required this.audioFileEntity});

  @override
  List<Object> get props => [audioFileEntity];
}

class AudioFileEntity extends Equatable {
  final int id;
  final String audioUrl;

  const AudioFileEntity({required this.id, required this.audioUrl});

  @override
  List<Object> get props => [id, audioUrl];
}
