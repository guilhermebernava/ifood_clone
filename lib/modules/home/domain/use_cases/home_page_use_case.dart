import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/modules/home/domain/entities/search_address.dart';
import 'package:ifood_clone/modules/home/domain/entities/tab_entity.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';

class HomePageUseCase implements IHomePageUseCase {
  @override
  Bloc<LocationEvent, LocationState> locationBloc;
  @override
  Bloc<UserEvent, UserState> userBloc;
  @override
  Bloc<NavigationEvent, NavigationState> navigationBloc;

  @override
  SearchAddress searchAddress = SearchAddress.empty();
  @override
  final formKey = GlobalKey<FormState>();
  @override
  final List<TabEntity> tabEntities;

  HomePageUseCase({
    required this.locationBloc,
    required this.userBloc,
    required this.tabEntities,
    required this.navigationBloc,
  });

  @override
  Future<void> validate() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    locationBloc.add(GetLocationFromAddress(searchAddress));
  }
}
