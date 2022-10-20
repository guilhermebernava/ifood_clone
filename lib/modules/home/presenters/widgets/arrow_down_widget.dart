import 'package:flutter/material.dart';
import 'package:ifood_clone/themes/app_colors/app_colors.dart';

class ArrowDownWidget extends StatelessWidget {
  final double? size;
  const ArrowDownWidget({super.key, this.size = 35});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.keyboard_arrow_down,
      color: AppColors.primary,
      size: size,
    );
  }
}
