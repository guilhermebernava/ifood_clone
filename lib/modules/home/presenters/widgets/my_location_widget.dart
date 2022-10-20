import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/location_error_widget.dart';
import 'package:ifood_clone/modules/home/text_styles/home_text_styles.dart';
import 'package:ifood_clone/themes/app_colors/app_colors.dart';

class MyLocationWidget extends StatelessWidget {
  final IHomePageUseCase homeUseCase;
  const MyLocationWidget({
    super.key,
    required this.homeUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.gps_fixed_outlined,
          color: AppColors.grey,
          size: 40,
        ),
        Column(
          children: [
            Text(
              'Usar minha localização:',
              style: HomeTextStyles.myLocationTitle,
            ),
            BlocBuilder(
                bloc: homeUseCase.locationBloc,
                builder: (_, bloc) {
                  if (bloc is LocationErrorState) {
                    return const LocationErrorWidget();
                  }
                  if (bloc is LocationSucessState) {
                    return Text(
                      bloc.address.street,
                      style: HomeTextStyles.myLocationSubTitle,
                    );
                  }

                  return Container();
                }),
          ],
        )
      ],
    );
  }
}
