import 'package:equatable/equatable.dart';

abstract class QuranOffState extends Equatable {
  const QuranOffState();
}

class QuranOffInitial extends QuranOffState {
  @override
  List<Object> get props => [];
}

class QuranOffAddBookmark extends QuranOffState {
  @override
  List<Object> get props => [];
}

class QuranOffGetBookmark extends QuranOffState {
  @override
  List<Object> get props => [];
}

class QuranOffLoadingBookmark extends QuranOffState {
  @override
  List<Object> get props => [];
}

class QuranOffGetLoadingBookmark extends QuranOffState {
  @override
  List<Object> get props => [];
}
