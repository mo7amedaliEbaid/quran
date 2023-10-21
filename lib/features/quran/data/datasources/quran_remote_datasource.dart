import 'package:hesn_elmuslim/features/quran/data/models/quran_audio_model.dart';
import 'package:hesn_elmuslim/features/quran/data/models/surah_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/quran_model.dart';

abstract class QuranRemoteDataSource {
  Future<QuranModel> quran();

  Future<SurahModel> surah({
    String? surahId,
  });
  Future<QuranAudioModel> audio({
    String? surahId,
  });
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  ApiConsumer apiConsumer;

  QuranRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuranModel> quran() async {
    final response = await apiConsumer.get(EndPoints.getQuran);

    return QuranModel.fromJson(response);
  }

  @override
  Future<SurahModel> surah({String? surahId}) async {
    final response = await apiConsumer.get(
      EndPoints.getSurah(surahId!),
    );

    return SurahModel.fromJson(response);
  }

  @override
  Future<QuranAudioModel> audio({String? surahId}) async {
    final response = await apiConsumer.get(
      EndPoints.getAudio(surahId!),
    );

    return QuranAudioModel.fromJson(response);
  }
}
