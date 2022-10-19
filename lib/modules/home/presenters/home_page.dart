import 'package:flutter/material.dart';
import 'package:ifood_clone/core/services/bottom_sheet.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/bottom_sheed/location_bottom_sheet.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/street_widget.dart';

class HomePage extends StatelessWidget {
  final IHomePageUseCase homeUseCase;

  const HomePage({
    Key? key,
    required this.homeUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          StreetWidget(
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
        ],
      ),
    );
  }
}
