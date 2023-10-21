import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/routes_manager.dart';
import 'package:hesn_elmuslim/core/widgets/component.dart';
import 'package:hesn_elmuslim/features/quran/presentation/surah_cubit/surah_cubit.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/app_bar/app_bar_custom.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/scaffold_custom/scaffold_custom.dart';
import '../../../../core/widgets/shimmer_custom/list_shimmer.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';
import '../quran_cubit/quran_cubit.dart';
import '../quran_cubit/quran_state.dart';

class QuranSurahScreen extends StatelessWidget {
  const QuranSurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: const AppBarCustom(
        text: 'القرآن',
      ),
      body: BlocProvider.value(
        value: BlocProvider.of<QuranCubit>(context)..getQuranFun(),
        child: BlocConsumer<QuranCubit, QuranStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = QuranCubit.get(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(
                          text: 'السورة',
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextCustom(
                          text: 'عدد الآيات',
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  state is GetQuranSuccess
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.quranEntity.data.length,
                          shrinkWrap: true,
                          itemExtent: 80,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            // width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 5.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0.r),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  color: Colors.grey[200]!,
                                  offset: const Offset(0.0, 3), //(x,y)
                                  blurRadius: 2.0,
                                ),
                              ],
                              color: ColorManager.cardColor,
                            ),
                            child: ListTile(
                                title: TextCustom(
                                  height: 0.0,
                                  text: state.quranEntity.data[index].name,
                                  fontSize: 20.sp,
                                ),
                                subtitle: TextCustom(
                                    height: 0.0,
                                    text: state
                                        .quranEntity.data[index].englishName,
                                    color: ColorManager.grey2),
                                trailing: SizedBox(
                                  width: 100.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextCustom(
                                        text:
                                            '(${state.quranEntity.data[index].numberOfAyahs})',
                                        fontSize: 16.sp,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Image(
                                        image: state.quranEntity.data[index]
                                                    .revelationType ==
                                                'Meccan'
                                            ? const AssetImage(
                                                'assets/images/kaaba.png',
                                              )
                                            : const AssetImage(
                                                'assets/images/madena.png',
                                              ),
                                        width: 30.w,
                                        height: 50.h,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  BlocProvider.of<SurahCubit>(context).surahId =
                                      (state.quranEntity.data[index].number)
                                          .toString();
                                  BlocProvider.of<SurahCubit>(context)
                                          .surahName =
                                      state.quranEntity.data[index].name;
                                  navigator(context, Routes.surahRoute);
                                }),
                          ),
                        )
                      : state is GetQuranLoading
                          ? const ListShimmer()
                          : ErrorWidgetCustom(onPress: () {
                              cubit.getQuranFun();
                            }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
