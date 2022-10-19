import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/location_error_widget.dart';

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
          color: Colors.grey,
          size: 40,
        ),
        Column(
          children: [
            const Text('Usar minha localização:'),
            BlocBuilder(
                bloc: homeUseCase.locationBloc,
                builder: (_, bloc) {
                  if (bloc is LocationErrorState) {
                    return const LocationErrorWidget();
                  }
                  if (bloc is SucessState) {
                    return Text(bloc.address.street);
                  }

                  return Container();
                }),
          ],
        )
      ],
    );
  }
}
