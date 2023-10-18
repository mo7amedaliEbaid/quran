import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/values_manager.dart';
import 'package:hesn_elmuslim/core/widgets/component.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/widgets/app_bar/app_bar_custom.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/ornament.dart';
import '../../../../core/widgets/scaffold_custom/scaffold_custom.dart';
import '../../../../core/widgets/shimmer_custom/grid_shimmer.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';
import '../../../quran/data/models/surah_names.dart';
import '../controller/aduio_cubit/audio_cubit.dart';
import '../controller/aduio_cubit/audio_state.dart';

class QuranAudioScreen extends StatelessWidget {
  const QuranAudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AudioCubit>(context)..getAudioFun(),
      child: BlocConsumer<AudioCubit, AudioState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AudioCubit.get(context);
          return ScaffoldCustom(
            appBarCustom: const AppBarCustom(
              text: 'القرآن',
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  children: [
                    state is GetAudioSuccessSate
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: SurahNames.surah.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              onTap: () async {
                                cubit.surahId = index;
                                print(cubit.surahId);
                                navigator(context, Routes.quranAudioRoute);
                                // await cubitQ.getQuranAudioFun();
                              },
                              child: FadeIn(
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  // width: double.infinity,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 5.h),

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
                                    color: ColorManager.card1Color,
                                  ),
                                  child: Stack(
                                    children: [
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Ornament(
                                          iconName: IconsAssets.ornament1Icon,
                                          iconColor:
                                              ColorManager.labelUnSelectedColor,
                                        ),
                                      ),
                                      Center(
                                        child: TextCustom(
                                          height: 0.0,
                                          text: SurahNames.surah[index],
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                          )
                        : state is GetAudioLoadingState
                            ? const GridShimmer()
                            : ErrorWidgetCustom(onPress: () {
                                cubit.getAudioFun();
                              }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
