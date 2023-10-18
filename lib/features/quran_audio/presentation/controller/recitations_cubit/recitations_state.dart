import 'package:equatable/equatable.dart';
import 'package:hesn_elmuslim/features/quran_audio/domain/entities/recitations_entity.dart';

abstract class RecitationsState extends Equatable {
  const RecitationsState();
}

class RecitationsInitial extends RecitationsState {
  @override
  List<Object> get props => [];
}

class GetRecitationsLoadingState extends RecitationsState {
  @override
  List<Object> get props => [];
}

class GetRecitationsSuccessState extends RecitationsState {
  final RecitationsEntity recitationsEntity;

  const GetRecitationsSuccessState({required this.recitationsEntity});
  @override
  List<Object> get props => [recitationsEntity];
}

class GetRecitationsErrorState extends RecitationsState {
  final String error;

  const GetRecitationsErrorState({required this.error});
  @override
  List<Object> get props => [];
}
