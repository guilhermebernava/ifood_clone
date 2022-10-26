import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/navigation_widget.dart';

class HomePage extends StatelessWidget {
  final IHomePageUseCase homeUseCase;

  const HomePage({
    Key? key,
    required this.homeUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const RouterOutlet(),
      ),
      bottomNavigationBar: NavigationWidger(
        homeUseCase: homeUseCase,
      ),
    );
  }
}
