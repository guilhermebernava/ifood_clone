import 'package:flutter/material.dart';
import 'package:ifood_clone/modules/home/domain/data/tab_entities.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/home_app_bar.dart';

class HomeTabPage extends StatefulWidget {
  final IHomePageUseCase homePageUseCase;
  const HomeTabPage({
    super.key,
    required this.homePageUseCase,
  });

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: widget.homePageUseCase.tabEntities.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HomeAppBar(
        size: size,
        homeUseCase: widget.homePageUseCase,
        tabController: _tabController,
        context: context,
      ),
      body: TabBarView(
        controller: _tabController,
        children:
            widget.homePageUseCase.tabEntities.map((e) => e.view).toList(),
      ),
    );
  }
}
