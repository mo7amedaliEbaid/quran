import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/widgets/shimmer_custom/shimmer_custom.dart';
import 'package:hesn_elmuslim/features/quran/presentation/screens/audio.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/app_bar/app_bar_custom.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/scaffold_custom/scaffold_custom.dart';
import '../../../../core/widgets/surah_custom.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';
import '../surah_cubit/surah_cubit.dart';
import '../surah_cubit/surah_state.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SurahCubit>(context)..getSurahFun(),
      child: BlocConsumer<SurahCubit, SurahStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SurahCubit.get(context);

          return ScaffoldCustom(
            appBarCustom: AppBarCustom(
              text: cubit.surahName,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: state is GetQuranSurahSuccess
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.surahEntity.data.ayahs.length,
                      // itemExtent: 100.0,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Column(
                          textDirection: TextDirection.rtl,
                          children: [
                            SurahCustom(
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: ListTile(
                                      title: TextCustom(
                                        textAlign: TextAlign.center,
                                        text:
                                            '${state.surahEntity.data.ayahs[index].text} (${state.surahEntity.data.ayahs[index].numberInSurah})',
                                        fontSize: 24.sp,
                                      ),
                                      subtitle: QuranAudio(
                                        urlAudio: state.surahEntity.data
                                            .ayahs[index].audio,
                                      ),

                                      // TextCustom(
                                      //   textAlign: TextAlign.center,
                                      //   text: state.surahEntity.data.ayahs[index]
                                      //       .audio,
                                      //   color: ColorManager.grey2,
                                      //   fontSize: 14.sp,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 20.h,
                              thickness: 2,
                              color: ColorManager.primary,
                            ),
                          ],
                        ),
                      ),
                    )
                  : state is GetQuranSurahLoading
                      ? ShimmerCustom(
                          child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 3,
                          // itemExtent: 100.0,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0.h),
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: [
                                const SurahCustom(
                                  widget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: ListTile(
                                          title: TextCustom(
                                            textAlign: TextAlign.center,
                                            text: '',
                                          ),
                                          subtitle: TextCustom(
                                            textAlign: TextAlign.center,
                                            text: '',
                                            color: ColorManager.grey2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 20.h,
                                  thickness: 2,
                                  color: ColorManager.primary,
                                ),
                              ],
                            ),
                          ),
                        ))
                      : ErrorWidgetCustom(onPress: () {
                          cubit.getSurahFun();
                        }),
            ),
          );
        },
      ),
    );
  }
}
