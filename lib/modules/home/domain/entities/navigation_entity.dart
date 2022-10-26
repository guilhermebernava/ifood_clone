import 'package:flutter/material.dart';

class NavigationEntity {
  final String label;
  final IconData icon;
  final Widget screen;

  NavigationEntity({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
