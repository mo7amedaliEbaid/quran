import 'package:equatable/equatable.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioInitial extends AudioState {
  @override
  List<Object> get props => [];
}

class PlayingState extends AudioState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DurationState extends AudioState {
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class PositionState extends AudioState {
  @override
// TODO: implement props
  List<Object?> get props => [];
}
