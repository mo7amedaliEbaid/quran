import 'package:hesn_elmuslim/features/quran_audio/domain/entities/recitations_entity.dart';

class RecitationsModel extends RecitationsEntity {
  RecitationsModel({List<RecitationEntity>? recitation})
      : super(
          recitations: recitation ?? [],
        );

  factory RecitationsModel.fromJson(Map<String, dynamic> json) =>
      RecitationsModel(
          recitation: List<RecitationEntity>.from(
              json['recitations'].map((e) => RecitationModel.fromJson(e))));
}

class RecitationModel extends RecitationEntity {
  RecitationModel({
    int? id,
    String? reciterName,
    String? style,
    TranslatedNameEntity? translatedName,
  }) : super(
          id: id ?? 0,
          reciterName: reciterName ?? '',
          style: style ?? '',
          translatedName: translatedName!,
        );

  factory RecitationModel.fromJson(Map<String, dynamic> json) =>
      RecitationModel(
        translatedName: TranslatedNameModel.fromJson(json['translated_name']),
        style: json['style'],
        reciterName: json['reciter_name'],
        id: json['id'],
      );
}

class TranslatedNameModel extends TranslatedNameEntity {
  const TranslatedNameModel({
    String? name,
    String? languageName,
  }) : super(
          name: name ?? '',
          languageName: languageName ?? '',
        );

  factory TranslatedNameModel.fromJson(Map<String, dynamic> json) =>
      TranslatedNameModel(
        languageName: json['language_name'],
        name: json['name'],
      );
}
