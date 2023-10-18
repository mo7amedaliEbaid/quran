import 'package:hesn_elmuslim/features/quran/domain/entities/quran_entity.dart';

class QuranModel extends QuranEntity {
  QuranModel({
    int? code,
    String? status,
    List<DataEntity>? data,
  }) : super(
          data: data!,
          code: code ?? 404,
          status: status ?? '',
        );

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        status: json['status'],
        code: json['code'],
        data: List.from(json['data'].map((e) => DataModel.fromJson(e))),
      );
}

class DataModel extends DataEntity {
  const DataModel({
    int? number,
    String? name,
    String? englishName,
    int? numberOfAyahs,
    String? revelationType,
  }) : super(
          name: name ?? '',
          englishName: englishName ?? '',
          number: number ?? 0,
          numberOfAyahs: numberOfAyahs ?? 0,
          revelationType: revelationType ?? '',
        );

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType'],
      );
}
