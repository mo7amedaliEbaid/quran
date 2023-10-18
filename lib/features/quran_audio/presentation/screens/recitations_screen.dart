import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/values_manager.dart';
import 'package:hesn_elmuslim/core/widgets/component.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/widgets/app_bar/app_bar_custom.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/ornament.dart';
import '../../../../core/widgets/scaffold_custom/scaffold_custom.dart';
import '../../../../core/widgets/shimmer_custom/grid_shimmer.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';
import '../controller/aduio_cubit/audio_cubit.dart';
import '../controller/recitations_cubit/recitations_cubit.dart';
import '../controller/recitations_cubit/recitations_state.dart';

class RecitationsScreen extends StatelessWidget {
  const RecitationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<RecitationsCubit>(context)..getRecitationsFun(),
      child: BlocConsumer<RecitationsCubit, RecitationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RecitationsCubit.get(context);
          return ScaffoldCustom(
            appBarCustom: const AppBarCustom(
              text: 'القراء',
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Column(
                  children: [
                    state is GetRecitationsSuccessState
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                state.recitationsEntity.recitations.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              onTap: () {
                                BlocProvider.of<AudioCubit>(context).reciterId =
                                    '${state.recitationsEntity.recitations[index].id}';
                                AppConstants.reciterName = state
                                    .recitationsEntity
                                    .recitations[index]
                                    .translatedName
                                    .name;
                                navigator(context, Routes.quranSoundRoute);
                              },
                              child: FadeIn(
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  // width: double.infinity,
                                  alignment: Alignment.center,
                                  // margin: EdgeInsets.symmetric(
                                  //     horizontal: 8.w, vertical: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 12.h),

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
                                    color: ColorManager.secondary2,
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextCustom(
                                              height: 0.0,
                                              text: state
                                                  .recitationsEntity
                                                  .recitations[index]
                                                  .translatedName
                                                  .name,
                                              fontSize: 20.sp,
                                              textAlign: TextAlign.center,
                                            ),
                                            TextCustom(
                                              height: 0.0,
                                              text: state
                                                          .recitationsEntity
                                                          .recitations[index]
                                                          .style ==
                                                      'Muallim'
                                                  ? 'الموليم'
                                                  : state
                                                              .recitationsEntity
                                                              .recitations[
                                                                  index]
                                                              .style ==
                                                          'Mujawwad'
                                                      ? 'مجود'
                                                      : 'مرتل',
                                              fontSize: 16.sp,
                                              textAlign: TextAlign.center,
                                              color: ColorManager
                                                  .textFormLabelColor,
                                            ),
                                          ],
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
                                    childAspectRatio: 6 / 5,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 20),
                          )
                        : state is GetRecitationsLoadingState
                            ? const GridShimmer()
                            : ErrorWidgetCustom(onPress: () {
                                cubit.getRecitationsFun();
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
