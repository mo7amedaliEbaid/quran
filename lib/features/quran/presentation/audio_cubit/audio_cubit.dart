import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial());
  static AudioCubit get(context) => BlocProvider.of(context);

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  playListen() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
      emit(PlayingState());
    });
  }

  durationListen() {
    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
      emit(DurationState());
    });
  }

  positionListen() {
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
      emit(PositionState());
    });
  }

  Future setAudio() async {
    String url =
        'https://cdn.islamic.network/quran/audio/128/ar.alafasy/6231.mp3';
    audioPlayer.setSourceUrl(url);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
