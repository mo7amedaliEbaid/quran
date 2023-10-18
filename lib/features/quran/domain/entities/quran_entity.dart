import 'package:equatable/equatable.dart';

class QuranEntity extends Equatable {
  final int code;
  final String status;
  final List<DataEntity> data;

  const QuranEntity({
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
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;

  const DataEntity({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  @override
  List<Object> get props =>
      [number, name, numberOfAyahs, revelationType, englishName];
}
