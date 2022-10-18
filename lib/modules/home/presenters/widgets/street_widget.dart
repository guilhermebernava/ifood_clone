import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/core/widgets/loading_widget.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';

class StreetWidget extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;
  final Bloc<LocationEvent, LocationState> locationBloc;

  const StreetWidget({
    super.key,
    required this.size,
    required this.locationBloc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: locationBloc,
      builder: (_, LocationState bloc) {
        if (bloc is LocationLoadingState) {
          return const LoadingWidget();
        }

        if (bloc is SucessState) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bloc.address.street),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.red,
                    size: 30,
                  )
                ],
              ),
            ),
          );
        }

        return const Text('ERROR');
      },
    );
  }
}
