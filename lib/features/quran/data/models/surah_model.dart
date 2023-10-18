import 'package:hesn_elmuslim/features/quran/domain/entities/surah_entity.dart';

class SurahModel extends SurahEntity {
  SurahModel({
    int? code,
    String? status,
    DataEntity? data,
  }) : super(
          data: data!,
          code: code ?? 404,
          status: status ?? '',
        );

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        status: json['status'],
        code: json['code'],
        data: DataModel.fromJson(json['data']),
      );
}

class DataModel extends DataEntity {
  DataModel({
    int? number,
    String? name,
    String? revelationType,
    int? numberOfAyahs,
    List<AyahsEntity>? ayahs,
    EditionEntity? edition,
  }) : super(
          revelationType: revelationType ?? '',
          numberOfAyahs: numberOfAyahs ?? 0,
          number: number ?? 0,
          name: name ?? '',
          ayahs: ayahs ?? [],
          edition: edition!,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        edition: EditionModel.fromJson(json['edition']),
        ayahs: List.from(json['ayahs'].map((e) => AyahsModel.fromJson(e))),
        name: json['name'],
        number: json['number'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType'],
      );
}

class AyahsModel extends AyahsEntity {
  AyahsModel({
    int? number,
    String? audio,
    List<String>? audioSecondary,
    String? text,
    int? numberInSurah,
    int? juz,
    int? page,
    int? ruku,
    int? hizbQuarter,
  }) : super(
          number: number ?? 0,
          page: page ?? 0,
          text: text ?? '',
          audio: audio ?? '',
          audioSecondary: audioSecondary ?? [],
          hizbQuarter: hizbQuarter ?? 0,
          juz: juz ?? 0,
          numberInSurah: numberInSurah ?? 0,
          ruku: ruku ?? 0,
        );

  factory AyahsModel.fromJson(Map<String, dynamic> json) => AyahsModel(
        ruku: json['ruku'],
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        hizbQuarter: json['hizbQuarter'],
        audioSecondary: json['audioSecondary'].cast<String>(),
        audio: json['audio'],
        text: json['text'],
        page: json['page'],
        number: json['number'],
      );
}

class EditionModel extends EditionEntity {
  const EditionModel({
    String? identifier,
    String? language,
    String? name,
  }) : super(
          name: name ?? '',
          identifier: identifier ?? '',
          language: language ?? '',
        );

  factory EditionModel.fromJson(Map<String, dynamic> json) => EditionModel(
        language: json['language'],
        identifier: json['identifier'],
        name: json['name'],
      );
}
