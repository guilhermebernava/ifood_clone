import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_bloc.dart';
import 'package:ifood_clone/modules/home/domain/data/tab_entities.dart';
import 'package:ifood_clone/modules/home/domain/use_cases/home_page_use_case.dart';
import 'package:ifood_clone/modules/home/external/location_datasource.dart';
import 'package:ifood_clone/modules/home/infra/location_repository.dart';
import 'package:ifood_clone/modules/home/presenters/home_page.dart';
import 'package:ifood_clone/modules/home/presenters/home_tab_page.dart';

class HomeModule extends Module {
  static const moduleRoute = '/Home';

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((_) => UserBloc()),
        Bind.singleton(
          (i) => LocationBloc(
            LocationRepository(
              LocationDatasource(),
            ),
          ),
        ),
        Bind.singleton((i) => NavigationBloc(0)),
        Bind.singleton(
          (i) => HomePageUseCase(
            locationBloc: Modular.get<LocationBloc>(),
            userBloc: Modular.get<UserBloc>(),
            navigationBloc: Modular.get<NavigationBloc>(),
            tabEntities: TabEntities.tabEntities,
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          transition: TransitionType.fadeIn,
          child: (_, __) => HomePage(
            homeUseCase: Modular.get<HomePageUseCase>(),
          ),
          children: [
            ChildRoute(
              "/home",
              child: (context, args) => HomeTabPage(
                homePageUseCase: Modular.get<HomePageUseCase>(),
              ),
            ),
            ChildRoute(
              "/restaurant",
              child: (context, args) => const Scaffold(),
            )
          ],
        )
      ];
}
