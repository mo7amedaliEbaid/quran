import 'package:hesn_elmuslim/features/quran_audio/data/models/audio_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/recitations_model.dart';

abstract class RecitationsRemoteDataSource {
  Future<RecitationsModel> recitations();
  Future<AudioModel> audio({required String reciterId});
}

class RecitationsRemoteDataSourceImpl implements RecitationsRemoteDataSource {
  ApiConsumer apiConsumer;

  RecitationsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<RecitationsModel> recitations() async {
    final response = await apiConsumer.get(EndPoints.getRecitations);

    return RecitationsModel.fromJson(response);
  }

  @override
  Future<AudioModel> audio({required String reciterId}) async {
    final response = await apiConsumer.get(EndPoints.getAudios(reciterId));

    return AudioModel.fromJson(response);
  }
}
