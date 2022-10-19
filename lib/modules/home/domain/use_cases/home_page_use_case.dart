import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/modules/home/domain/entities/search_address.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';

class HomePageUseCase implements IHomePageUseCase {
  @override
  Bloc<LocationEvent, LocationState> locationBloc;
  @override
  Bloc<UserEvent, UserState> userBloc;
  @override
  SearchAddress searchAddress = SearchAddress.empty();
  @override
  final formKey = GlobalKey<FormState>();

  HomePageUseCase({required this.locationBloc, required this.userBloc});

  @override
  Future<void> validate() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    print(searchAddress.address.value);
  }
}
