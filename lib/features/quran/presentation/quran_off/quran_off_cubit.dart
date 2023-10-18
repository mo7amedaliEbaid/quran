import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesn_elmuslim/core/local/cache_helper.dart';
import 'package:hesn_elmuslim/core/widgets/component.dart';
import 'package:hesn_elmuslim/features/quran/presentation/quran_off/quran_off_state.dart';
import 'package:pdfx/pdfx.dart';

import '../../../../core/utils/constants_manager.dart';

class QuranOffCubit extends Cubit<QuranOffState> {
  QuranOffCubit() : super(QuranOffInitial());

  static QuranOffCubit get(context) => BlocProvider.of(context);

  final pdfController = PdfController(
    initialPage: CacheHelper.get(key: 'bookmark') ?? 0,
    viewportFraction: 1.2,
    document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
  );

  TextEditingController num = TextEditingController();
  int? bookmark = 0;
  addBookmark(BuildContext context) async {
    emit(QuranOffLoadingBookmark());
    int lastBooked = CacheHelper.get(key: 'bookmark') ?? 0;
    if (bookmark == lastBooked) {
      CacheHelper.removeData(key: 'bookmark');
      showToast(
        context,
        message: 'تم ازالة الصفحة',
      );
      getBookmark();
    } else {
      await CacheHelper.put(key: 'bookmark', value: bookmark);
      showToast(context, message: 'تم اضافة الصفحة', type: MessageType.error);

      emit(QuranOffAddBookmark());
    }
  }

  int lastBooked = 0;
  getBookmark() async {
    emit(QuranOffGetLoadingBookmark());
    lastBooked = CacheHelper.get(key: 'bookmark') ?? 0;
    if (lastBooked == bookmark) {
      emit(QuranOffGetBookmark());
    } else {
      emit(QuranOffGetBookmark());
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
