import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:hesn_elmuslim/core/utils/assets_manager.dart';
import 'package:hesn_elmuslim/core/utils/routes_manager.dart';
import 'package:hesn_elmuslim/core/utils/strings_manager.dart';
import 'package:hesn_elmuslim/core/utils/values_manager.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/media_query_values.dart';

import '../widgets/home_card.dart';
import '../widgets/home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s100 * 2.6,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    color: ColorManager.secondary2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.s100 * 2.6,
                    child: FadeIn(
                      child: Image.asset(
                        ImageAssets.mosqueImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HomeItem(title: 'القرآن الكريم', widgets: <Widget>[
              HomeCard(
                label: AppStrings.quran,
                url: ImageAssets.quranImg,
                screen: Routes.quranRoute,
              ),
              HomeCard(
                label: AppStrings.quran2,
                url: ImageAssets.quranAImg,
                screen: Routes.recitationsRoute,
              ),
              HomeCard(
                label: AppStrings.quran1,
                url: ImageAssets.quran1Img,
                screen: Routes.quranOffRoute,
              ),

            ]),
          ],
        ),
      ),
    );
  }
}
