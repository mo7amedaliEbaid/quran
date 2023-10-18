import 'package:equatable/equatable.dart';

class SurahEntity extends Equatable {
  final int code;
  final String status;
  final DataEntity data;

  const SurahEntity({
    required this.code,
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [code, status, data];
}

class DataEntity extends Equatable {
  final int number;
  final String name;
  final int numberOfAyahs;
  final String revelationType;
  final List<AyahsEntity> ayahs;
  final EditionEntity edition;

  const DataEntity({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.ayahs,
    required this.edition,
  });

  @override
  List<Object> get props =>
      [number, name, numberOfAyahs, revelationType, ayahs, edition];
}

class AyahsEntity extends Equatable {
  final int number;
  final String audio;
  final List<String> audioSecondary;
  final String text;
  final int numberInSurah;
  final int juz;
  final int page;
  final int ruku;
  final int hizbQuarter;

  const AyahsEntity({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
  });

  @override
  List<Object> get props => [
        number,
        audio,
        audioSecondary,
        text,
        numberInSurah,
        juz,
        page,
        ruku,
        hizbQuarter,
      ];
}

class EditionEntity extends Equatable {
  final String identifier;
  final String language;
  final String name;

  const EditionEntity({
    required this.identifier,
    required this.language,
    required this.name,
  });

  @override
  List<Object> get props => [identifier, language, name];
}
