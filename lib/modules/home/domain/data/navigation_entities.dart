import 'package:flutter/material.dart';
import 'package:ifood_clone/modules/home/domain/entities/navigation_entity.dart';

class NavigationEntities {
  static final navigationEntities = [
    NavigationEntity(
      icon: Icons.home,
      label: 'Home',
      screen: TabBarView(
        controller: _tabController,
        children: widget.homeUseCase.tabEntities.map((e) => e.view).toList(),
      ),
    ),
    NavigationEntity(
      icon: Icons.abc,
      label: 'ABC',
      screen: Container(),
    )
  ];
}
