import 'package:equatable/equatable.dart';

class AudioEntity extends Equatable {
  final List<AudioFilesEntity> audioFiles;

  const AudioEntity({required this.audioFiles});

  @override
  List<Object> get props => [audioFiles];
}

class AudioFilesEntity extends Equatable {
  final int id;

  // final int chapterId;
  // final int fileSize;
  // final String format;
  final String audioUrl;

  const AudioFilesEntity(
      {required this.id,
      // required this.chapterId,
      // required this.fileSize,
      // required this.format,
      required this.audioUrl});

  @override
  List<Object> get props => [
        id,
        // chapterId,
        // fileSize,
        // format,
        audioUrl,
      ];
}
