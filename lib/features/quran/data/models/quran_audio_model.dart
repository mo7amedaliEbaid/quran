import 'package:hesn_elmuslim/features/quran/domain/entities/quran_audio_entity.dart';

class QuranAudioModel extends QuranAudioEntity {
  QuranAudioModel({
    AudioFileEntity? audioFileEntity,
  }) : super(audioFileEntity: audioFileEntity!);

  factory QuranAudioModel.fromJson(Map<String, dynamic> json) =>
      QuranAudioModel(
          audioFileEntity: AudioFileModel.fromJson(json['audio_file']));
}

class AudioFileModel extends AudioFileEntity {
  const AudioFileModel({
    int? id,
    String? audioUrl,
  }) : super(
          id: id ?? 0,
          audioUrl: audioUrl ?? '',
        );

  factory AudioFileModel.fromJson(Map<String, dynamic> json) => AudioFileModel(
        audioUrl: json['audio_url'],
        id: json['id'],
      );
}
