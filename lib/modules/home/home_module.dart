import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_bloc.dart';
import 'package:ifood_clone/modules/home/external/location_datasource.dart';
import 'package:ifood_clone/modules/home/infra/location_repository.dart';
import 'package:ifood_clone/modules/home/presenters/home_page.dart';

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
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => HomePage(
            userBloc: Modular.get<UserBloc>(),
            locationBloc: Modular.get<LocationBloc>(),
          ),
        )
      ];
}
