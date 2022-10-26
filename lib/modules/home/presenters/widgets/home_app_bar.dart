import 'package:flutter/material.dart';
import 'package:ifood_clone/core/services/bottom_sheet.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/bottom_sheed/location_bottom_sheet.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/street_widget.dart';
import 'package:ifood_clone/modules/home/text_styles/home_text_styles.dart';
import 'package:ifood_clone/themes/app_colors/app_colors.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    Key? key,
    required Size size,
    required BuildContext context,
    required IHomePageUseCase homeUseCase,
    required TabController tabController,
  }) : super(
          key: key,
          backgroundColor: AppColors.white,
          title: StreetWidget(
            size: size,
            locationBloc: homeUseCase.locationBloc,
            onTap: () => BottomSheetServices.showAllScreenBottomSheet(
              LocationBottomSheet(
                homeUseCase: homeUseCase,
                size: size,
              ),
              context,
            ),
          ),
          bottom: TabBar(
            labelStyle: HomeTextStyles.tabLabelStyle,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.5,
            isScrollable: true,
            controller: tabController,
            tabs: homeUseCase.tabEntities
                .map((e) => Tab(
                      text: e.text,
                      key: ValueKey(e.text),
                    ))
                .toList(),
          ),
        );
}
