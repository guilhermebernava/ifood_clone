import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_bloc.dart';
import 'package:ifood_clone/modules/home/home_page.dart';

class HomeModule extends Module {
  static const moduleRoute = '/Home';

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((_) => UserBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => HomePage(
            userBloc: Modular.get<UserBloc>(),
          ),
        )
      ];
}
