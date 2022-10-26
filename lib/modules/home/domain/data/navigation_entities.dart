import 'package:flutter/material.dart';
import 'package:ifood_clone/modules/home/domain/entities/navigation_entity.dart';

class NavigationEntities {
  static final navigationEntities = [
    NavigationEntity(
      icon: Icons.home,
      label: 'Home',
      screen: Container(),
    ),
    NavigationEntity(
      icon: Icons.abc,
      label: 'ABC',
      screen: Container(),
    )
  ];
}
