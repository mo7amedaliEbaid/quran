import 'package:hesn_elmuslim/features/quran_audio/domain/entities/audio_entity.dart';

class AudioModel extends AudioEntity {
  AudioModel({
    List<AudioFilesEntity>? audioFilesEntity,
  }) : super(
          audioFiles: audioFilesEntity ?? [],
        );

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        audioFilesEntity: List<AudioFilesEntity>.from(
            json['audio_files'].map((e) => AudioFilesModel.fromJson(e))),
      );
}

class AudioFilesModel extends AudioFilesEntity {
  const AudioFilesModel({
    int? id,
    // int? chapterId,
    // int? fileSize,
    // String? format,
    String? audioUrl,
  }) : super(
          id: id ?? 0,
          audioUrl: audioUrl ?? '',
          // chapterId: chapterId ?? 0,
          // fileSize: fileSize ?? 0,
          // format: format ?? '',
        );

  factory AudioFilesModel.fromJson(Map<String, dynamic> json) =>
      AudioFilesModel(
        // format: json['format'],
        // fileSize: json['file_size'],
        // chapterId: json['chapter_id'],
        audioUrl: json['audio_url'],
        id: json['id'],
      );
}
