import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/modules/home/home_module.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.to.navigate(HomeModule.moduleRoute);
    return const Material(
      color: Colors.red,
    );
  }
}
