import 'package:equatable/equatable.dart';

class RecitationsEntity extends Equatable {
  final List<RecitationEntity> recitations;

  const RecitationsEntity({required this.recitations});

  @override
  List<Object> get props => [recitations];
}

class RecitationEntity extends Equatable {
  final int id;
  final String reciterName;
  final String style;
  final TranslatedNameEntity translatedName;

  const RecitationEntity(
      {required this.id,
      required this.reciterName,
      required this.style,
      required this.translatedName});

  @override
  List<Object> get props => [id, reciterName, style, translatedName];
}

class TranslatedNameEntity extends Equatable {
  final String name;
  final String languageName;

  const TranslatedNameEntity({required this.name, required this.languageName});

  @override
  List<Object> get props => [name, languageName];
}
