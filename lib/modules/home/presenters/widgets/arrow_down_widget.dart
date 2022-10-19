import 'package:flutter/material.dart';

class ArrowDownWidget extends StatelessWidget {
  final double? size;
  const ArrowDownWidget({super.key, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.keyboard_arrow_down,
      color: Colors.red,
      size: size,
    );
  }
}
