import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  final IHomePageUseCase homeUseCase;

  const HomePage({
    Key? key,
    required this.homeUseCase,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: widget.homeUseCase.tabEntities.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HomeAppBar(
        size: size,
        homeUseCase: widget.homeUseCase,
        tabController: _tabController,
        context: context,
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.homeUseCase.tabEntities.map((e) => e.view).toList(),
      ),
      bottomNavigationBar: BlocBuilder(
        bloc: widget.homeUseCase.navigationBloc,
        builder: (_, bloc) {
          if (bloc is NavigationSuccess) {
            return BottomNavigationBar(
              currentIndex: bloc.index,
              onTap: (value) =>
                  widget.homeUseCase.navigationBloc.add(ChangeScreen(value)),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC')
              ],
            );
          }

          //TODO implement an error widget
          return Container();
        },
      ),
    );
  }
}
