import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/street_widget.dart';

class HomePage extends StatelessWidget {
  final Bloc<UserEvent, UserState> userBloc;
  final Bloc<LocationEvent, LocationState> locationBloc;

  const HomePage({
    Key? key,
    required this.userBloc,
    required this.locationBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    locationBloc.add(GetLocation());
    return Scaffold(
      body: Column(
        children: [
          StreetWidget(
            size: size,
            locationBloc: locationBloc,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
