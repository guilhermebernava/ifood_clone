import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/entities/search_address.dart';
import 'package:ifood_clone/modules/home/domain/entities/tab_entity.dart';

abstract class IHomePageUseCase {
  final Bloc<UserEvent, UserState> userBloc;
  final Bloc<LocationEvent, LocationState> locationBloc;
  final Bloc<NavigationEvent, NavigationState> navigationBloc;
  final SearchAddress searchAddress;
  final GlobalKey<FormState> formKey;
  final List<TabEntity> tabEntities;

  IHomePageUseCase(
      {required this.locationBloc,
      required this.userBloc,
      required this.searchAddress,
      required this.formKey,
      required this.tabEntities,
      required this.navigationBloc});

  Future<void> validate();
}
