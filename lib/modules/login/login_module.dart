import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/modules/login/login_page.dart';

class LoginModule extends Module {
  static const moduleRoute = '/login';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const LoginPage(),
        )
      ];
}
