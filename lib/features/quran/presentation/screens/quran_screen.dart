import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/local/cache_helper.dart';
import 'package:hesn_elmuslim/core/widgets/scaffold_custom/scaffold_custom.dart';

import 'package:pdfx/pdfx.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/app_bar/app_bar_custom.dart';
import '../../../../core/widgets/elevated_button/elevated_button_custom.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';
import '../../../../core/widgets/text_form_field/text_form_field_custom.dart';
import '../quran_off/quran_off_cubit.dart';
import '../quran_off/quran_off_state.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranOffCubit(),
      child: BlocConsumer<QuranOffCubit, QuranOffState>(
        listener: (context, state) {},
        builder: (context, state) {
          var quranCubit = QuranOffCubit.get(context);
          return ScaffoldCustom(
            appBarCustom: const AppBarCustom(
              text: 'المصحف الكريم',
            ),
            body: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButtonCustom(
                      width: 70.w,
                      text: 'اذهب',
                      onPressed: () {
                        // Animate to specified page
                        quranCubit.pdfController.animateToPage(
                          int.parse(quranCubit.num.text),
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.ease,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: SizedBox(
                        width: 60.w,
                        child: TextFormFieldCustom(
                          fillColor: ColorManager.white,
                          padding: 10,
                          validate: (v) {
                            if (v!.isEmpty) {
                              return 'رقم الصفحة';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: quranCubit.num,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      PdfView(
                        builders: PdfViewBuilders<DefaultBuilderOptions>(
                          options: const DefaultBuilderOptions(),
                          documentLoaderBuilder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          pageLoaderBuilder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          errorBuilder: (_, error) =>
                              Center(child: Text(error.toString())),
                        ),
                        scrollDirection: Axis.horizontal,
                        backgroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: ColorManager.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[100]!,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        controller: quranCubit.pdfController,
                        onDocumentLoaded: (pd) {
                          quranCubit.bookmark =
                              CacheHelper.get(key: 'bookmark') ?? 0;
                          quranCubit.getBookmark();
                        },
                        onPageChanged: (i) async {
                          quranCubit.bookmark = i;
                          await quranCubit.getBookmark();
                        },
                      ),
                      IconButton(
                          onPressed: () async {
                            await quranCubit.addBookmark(context);
                          },
                          icon: state is QuranOffAddBookmark ||
                                  quranCubit.bookmark == quranCubit.lastBooked
                              ? Bounce(
                                  child: const Icon(
                                  Icons.bookmark_added_rounded,
                                  color: ColorManager.greenColor,
                                ))
                              : FadeIn(
                                  child:
                                      const Icon(Icons.bookmark_add_outlined))),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: const Key('forward'),
                  onPressed: () {
                    // Animate to previous page
                    quranCubit.pdfController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut);
                  },
                  child: const TextCustom(
                    text: 'السابق',
                    color: ColorManager.white,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 120.w,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    color: ColorManager.cardColor,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: ColorManager.primary),
                  ),
                  child: PdfPageNumber(
                    controller: quranCubit.pdfController,
                    // When `loadingState != PdfLoadingState.success`  `pagesCount` equals null_
                    builder: (_, state, loadingState, pagesCount) => Container(
                      alignment: Alignment.center,
                      child: TextCustom(
                          height: 0.0,
                          textAlign: TextAlign.center,
                          text: state == PdfLoadingState.success
                              ? '${quranCubit.pdfController.page.toString()}/${pagesCount ?? 0}'
                              : '',
                          fontSize: 22.sp),
                    ),
                  ),
                ),
                FloatingActionButton(
                  heroTag: const Key('next'),
                  onPressed: () {
                    // Animate to next page
                    quranCubit.pdfController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  child: const TextCustom(
                    text: 'التالي',
                    color: ColorManager.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
