import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/themes/app_colors/app_colors.dart';

class NavigationWidger extends StatelessWidget {
  final IHomePageUseCase homeUseCase;

  const NavigationWidger({
    super.key,
    required this.homeUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeUseCase.navigationBloc,
      builder: (_, bloc) {
        if (bloc is NavigationSuccess) {
          return BottomNavigationBar(
            currentIndex: bloc.index,
            fixedColor: AppColors.primary,
            onTap: (value) =>
                homeUseCase.navigationBloc.add(ChangeScreen(value)),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC')
            ],
          );
        }

        //TODO implement an error widget
        return Container();
      },
    );
  }
}
