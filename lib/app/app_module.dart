import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/modules/home/home_module.dart';
import 'package:ifood_clone/modules/login/login_module.dart';
import 'package:ifood_clone/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const SplashPage(),
        ),
        ModuleRoute(
          LoginModule.moduleRoute,
          module: LoginModule(),
        ),
        ModuleRoute(
          HomeModule.moduleRoute,
          module: HomeModule(),
        )
      ];
}
