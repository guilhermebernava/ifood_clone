import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/app/app.dart';
import 'package:ifood_clone/app/app_module.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
